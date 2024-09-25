<?php

namespace App\Providers;

use App\Models\Notification;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        View::composer('*', function ($view) {
            // Adjust the query to get the notifications you need
            if (Auth::check()) {
                $notifications = Notification::where('notifiable_id', Auth::id())->get();
                $count = Notification::where('notifiable_id', Auth::id())->count();
                $now = Carbon::now()->addHours(3);
                $remainingtimes = [];

                // Loop through each plan to calculate the remaining time
                foreach ($notifications as $item) {
                    $to = Carbon::parse($item->created_at)->addHours(3);
                    $diff = $now->diff($to);
                    $remainingtimes[] = $diff->format(' %d days, %h hours, %i minutes, %s seconds');

                }
                $view->with(['Notifications' => $notifications, 'count' => $count, 'remainingtimes' => $remainingtimes]);
            }
        });

    }
}
