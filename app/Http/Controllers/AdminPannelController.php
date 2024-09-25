<?php

namespace App\Http\Controllers;

use App\Models\About;
use App\Models\Comment;
use App\Models\Contactus;
use App\Models\Payments;
use App\Models\Services;
use App\Models\Subscription;
use App\Models\User;
use App\Models\Visitor;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class AdminPannelController extends Controller
{
    public function index()
    {
        $users = DB::table('users')->get();
        $packages = DB::table('packages')->get();
        $news = DB::table('news')->get();
        $subscriptions = DB::table('subscriptions')
            ->join('users', 'subscriptions.user_id', '=', 'users.id')
            ->join('packages', 'subscriptions.package_id', '=', 'packages.id')
            ->select('subscriptions.*', 'users.name as user_name', 'users.email as user_email', 'packages.name as package_name')
            ->get();
        $comment = Comment::with('user')->latest()->get();
        $contactus = Contactus::with('user')->latest()->get();
        $about = About::all();
        $financial = DB::select('with package_totals AS ( SELECT COUNT(s.package_id) AS no_of_subscriptions, s.package_id, p.name, p.price, COUNT(s.package_id) * p.price AS total_price_of_each_package FROM payments s JOIN packages p ON s.package_id = p.id GROUP BY s.package_id, p.name, p.price ), total_sum AS ( SELECT SUM(total_price_of_each_package) AS total_price_of_all_packages FROM package_totals ) SELECT pt.no_of_subscriptions, pt.package_id, pt.name, pt.price, pt.total_price_of_each_package, ts.total_price_of_all_packages FROM package_totals pt, total_sum ts;');
        $services = Services::all();

        return view('adminpannel', ['users' => $users, 'packages' => $packages,
            'news' => $news, 'subscriptor' => $subscriptions, 'comments' => $comment,
            'complains' => $contactus, 'about' => $about, 'financial' => $financial,
            'services' => $services]);
    }

    public function Adashboard()
    {
        $visitorCount = Visitor::count();
        $subscribersCount = Subscription::count();
        $financial = DB::select('with package_totals AS ( SELECT COUNT(s.package_id) AS no_of_subscriptions, s.package_id, p.name, p.price, COUNT(s.package_id) * p.price AS total_price_of_each_package FROM subscriptions s JOIN packages p ON s.package_id = p.id GROUP BY s.package_id, p.name, p.price ), total_sum AS ( SELECT SUM(total_price_of_each_package) AS total_price_of_all_packages FROM package_totals ) SELECT pt.no_of_subscriptions, pt.package_id, pt.name, pt.price, pt.total_price_of_each_package, ts.total_price_of_all_packages FROM package_totals pt, total_sum ts;');
        $onlineCount = User::where('status', 'online')->count();
        $users = User::all();
        $subscriptions = Subscription::all();
        $payments = Payments::all();
        $totalPrice = 0;
        foreach ($payments as $item) {
            $totalPrice += $item->package->price;
        }
        $orderCount = Payments::count();
        $Daily = Payments::whereDate('created_at', Carbon::today())->get();
        $dailysales = 0;
        foreach ($Daily as $item) {
            $dailysales += $item->package->price;
        }

        return view('admin.Adashboard', ['visitorCount' => $visitorCount,
            'subscribersCount' => $subscribersCount, 'orderCount' => $orderCount,
            'payments' => $payments, 'onlineCount' => $onlineCount,
            'users' => $users, 'subscriptions' => $subscriptions,
            'totalPrice' => $totalPrice, 'dailysales' => $dailysales,
        ]);
    }

    public function admin()
    {
        $notifications = Notification::where('notifiable_id', Auth::id())->get();
        $count = Notification::where('notifiable_id', Auth::id())->count();
        $now = Carbon::now()->addHours(3);
        $remainingtimes = [];

        // Loop through each plan to calculate the remaining time
        foreach ($notifications as $item) {
            $to = Carbon::parse($item->created_at);
            $diff = $now->diff($to);
            $remainingtimes[] = $diff->format(' %d days, %h hours, %i minutes, %s seconds');

        }

        return view('admin.admin', ['Notifications' => $notifications, 'count' => $count, 'remainingtimes' => $remainingtimes]);
    }
}

//SELECT count(package_id),package_id FROM `subscriptions` GROUP by package_id;
