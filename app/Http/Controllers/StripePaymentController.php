<?php

namespace App\Http\Controllers;

use App\Models\Myplan;
use App\Models\Packages;
use App\Models\Payments;
use App\Models\Subscription;
use App\Models\User;
use App\Notifications\NewUserMakePayment;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Notification;
use Stripe\Charge;
use Stripe\Stripe;

class StripePaymentController extends Controller
{
    public function index()
    {
        $payments = Payments::all();

        return view('admin.payments', ['payments' => $payments]);
    }

    public function show(Request $request, $id)
    {

        $result2 = DB::table('packages')->where('id', $id)->get();

        return view('payment', ['packages' => $result2]);
    }

    public function process(Request $request)
    {
        Stripe::setApiKey(env('STRIPE_SECRET'));

        try {
            $charge = Charge::create([
                'amount' => $request->amount * 100, // Amount in cents
                'currency' => 'usd',
                'source' => $request->stripeToken,
                'description' => 'Test payment',
            ]);
            $payments = Payments::create([
                'user_id' => Auth::id(),
                'package_id' => $request->package_id,
            ]);
            $currentDateTime = Carbon::now()->addHours(3);
            $dateTimePlusMonths = Carbon::now()->addHours(3);
            $packages = Packages::all();
            foreach ($packages as $item) {
                if ($request->package_id == $item->id) {
                    $dateTimePlusMonths = $dateTimePlusMonths->modify('+' . $request->duration);
                }
            }

            // Find and update the existing subscription for the user

            // Check if a subscription exists for the current user
            $subscription = Subscription::where('user_id', Auth::id())->first();

            if ($subscription) {
                // Update the existing subscription
                $subscription->update([
                    'from_date' => $currentDateTime,
                    'to_date' => $dateTimePlusMonths, // Make sure $dateTimePlusMonths is already calculated
                    'package_id' => $request->package_id,
                ]);

                // Check if a corresponding Myplan exists and update it
                $myplan = Myplan::where('subscription_id', $subscription->id)->first();

                if ($myplan) {
                    // Update the existing Myplan
                    $toDate = Carbon::parse($myplan->to_date)->modify('+' . $request->duration);
                    $myplan->update([
                        'to_date' => $toDate,
                        'package_id' => $request->package_id,
                        'user_id' => Auth::id(),
                        'package_name' => $request->package_name,
                        'duration' => $request->duration,
                        'property2' => $request->property2,
                        'property3' => $request->property3,
                        'property4' => $request->property4,
                    ]);
                } else {
                    // Handle case where Myplan does not exist, create it
                    Myplan::create([
                        'from_date' => $currentDateTime,
                        'to_date' => $dateTimePlusMonths,
                        'package_id' => $request->package_id,
                        'user_id' => Auth::id(),
                        'package_name' => $request->package_name,
                        'duration' => $request->duration,
                        'property2' => $request->property2,
                        'property3' => $request->property3,
                        'property4' => $request->property4,
                        'subscription_id' => $subscription->id, // Assign the subscription's ID
                    ]);
                }
            } else {
                // If no subscription exists, create a new one
                $subscription = Subscription::create([
                    'from_date' => $currentDateTime,
                    'to_date' => $dateTimePlusMonths, // Make sure $dateTimePlusMonths is already calculated
                    'package_id' => $request->package_id,
                    'user_id' => Auth::id(),
                ]);

                // Create the associated Myplan
                Myplan::create([
                    'from_date' => $currentDateTime,
                    'to_date' => $dateTimePlusMonths,
                    'package_id' => $request->package_id,
                    'user_id' => Auth::id(),
                    'package_name' => $request->package_name,
                    'duration' => $request->duration,
                    'property2' => $request->property2,
                    'property3' => $request->property3,
                    'property4' => $request->property4,
                    'subscription_id' => $subscription->id, // Assign the newly created subscription's ID
                ]);
            }



            // Find the associated Myplan and update it


            // Fetch admin user(s)
            $admin = User::where('role_as', 'admin')->get();
            // Notify admin(s)
            Notification::send($admin, new NewUserMakePayment($subscription));

            return back()->with('success_message', 'Payment successful!');

        } catch (\Exception $ex) {
            return back()->with('error_message', 'Payment failed! ' . $ex->getMessage());
        }
    }
}