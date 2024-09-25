<?php

namespace App\Http\Controllers;

use App\Models\Myplan;
use App\Models\Packages;
use App\Models\Subscription;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SubscriptionController extends Controller
{
    protected $table = 'subscriptions';

    public function index()
    {
        $subscriptions = DB::table('subscriptions')
            ->join('users', 'subscriptions.user_id', '=', 'users.id')
            ->join('packages', 'subscriptions.package_id', '=', 'packages.id')
            ->select('subscriptions.*', 'users.name as user_name', 'users.email as user_email', 'packages.name as package_name')
            ->get();
        $packages = Packages::all();
        $users = User::all();

        return view('admin.subscription', ['subscriptor' => $subscriptions, 'packages' => $packages, 'users' => $users]);
    }

    public function destroy($id)
    {
        DB::table('subscriptions')->where('id', $id)->delete();
        $result = DB::table('users')->get();
        $msg = 'This subscription has been deleted';

        return redirect()->back()->with('msg', $msg);
    }

    public function insert(Request $request)
    {
        $msg = 'The subscription has been added successfully';
        $subscription = Subscription::create([
            'from_date' => $request->from_date,
            'to_date' => $request->to_date,
            'package_id' => $request->package_id,
            'user_id' => $request->user_id,
        ]);
        $mypack = Packages::all()->where('id', '=', $request->package_id)->first();
        $myplans = Myplan::create([
            'from_date' => $request->from_date,
            'to_date' => $request->to_date,
            'package_id' => $request->package_id,
            'user_id' => $request->user_id,
            'package_name' => $mypack->name,
            'duration' => $mypack->duration,
            'property2' => $mypack->property2,
            'property3' => $mypack->property3,
            'property4' => $mypack->property4,
            'subscription_id' => $subscription->id,

        ]);

        return redirect()->back()->with('msg', $msg);
    }

    public function update(Request $request, $id)
    {
        $subscription = Subscription::findOrFail($id);

        // Update Subscription data
        $subscription->from_date = $request->from_date;
        $subscription->to_date = $request->to_date;
        $subscription->package_id = $request->package_id;
        $subscription->user_id = $request->user_id;

        // Save the updated subscription data
        $subscription->save();

        return redirect()->back()->with('msg', 'Subscription updated successfully');
    }

    public function myplans(Request $request)
    {
        $id = $request->user()->id;
        $myplans = Myplan::all()->where('user_id', '=', $id)->first();
        if ($myplans) {
            // Get the date input from the request
            $now = Carbon::now()->addHours(3);

            // Retrieve plans for the specific user
            $myplans = DB::select('select * from myplans where user_id = ?', [$request->user()->id]);

            // Initialize an array to store the remaining times
            $remainingTimes = [];

            // Loop through each plan to calculate the remaining time
            foreach ($myplans as $plan) {
                $to = Carbon::parse($plan->to_date);

                if ($now > $to) {
                    $remainingTimes[] = '0 years, 0 months, 0 days, 0 hours, 0 minutes, 0 seconds';
                } else {
                    $diff = $to->diff($now);
                    $remainingTimes[] = $diff->format('%y years, %m months, %d days, %h hours, %i minutes, %s seconds');
                }
            }

            // Return the view with the plans and the remaining times
            return view('myplans', [
                'myplans' => $myplans,
                'remainingTimes' => $remainingTimes,
                'user' => $request->user(),
            ]);
        } else {
            return view('emptyplan', ['user' => $request->user()]);
        }
    }
}