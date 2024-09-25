<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\User;
use Illuminate\View\View;
use App\Models\Notification;
use App\Models\Subscription;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Redirect;
use App\Http\Requests\ProfileUpdateRequest;

class ProfileController extends Controller
{
    /**
     * Display the user's profile form.
     */
    public function edit(Request $request): View
    {
        return view('profile.edit', [
            'user' => $request->user(),
        ]);
    }

    /**
     * Update the user's profile information.
     */
    public function update(ProfileUpdateRequest $request): RedirectResponse
    {
        $request->user()->fill($request->validated());

        if ($request->user()->isDirty('email')) {
            $request->user()->email_verified_at = null;
        }

        $request->user()->save();

        return Redirect::route('profile.edit')->with('status', 'profile-updated');
    }

    /**
     * Delete the user's account.
     */
    public function destroy(Request $request): RedirectResponse
    {
        $request->validateWithBag('userDeletion', [
            'password' => ['required', 'current_password'],
        ]);

        $user = $request->user();

        Auth::logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();
        Subscription::where('user_id', $user->id)->delete();
        $user->delete();

        return Redirect::to('/');
    }

    public function use_requests()
    {
        $token = Auth::user()->createToken('API Token')->plainTextToken;
        // dd($token);
        Log::info('Current CSRF Token: ' . csrf_token());
        return view('use_requests')->with(['token' => $token]);
    }

    public function change_photo(Request $request)
    {
        $user = Auth::user();
        $photo = $request->photo;
        $name = Auth::user()->email;
        $path = 'assets/img/profile_photos/';
        $file_extension = $photo->getClientOriginalExtension();
        $filename = $name . '.' . $file_extension;
        $request->photo->move($path, $filename);
        $photo = $path . $filename;
        $user->photo = $photo;
        $user->save();

        return redirect()->back();
    }

    public function myprofile()
    {
        $notifications = Notification::where('notifiable_id', Auth::id())->get();
        if ($notifications) {
            $count = Notification::where('notifiable_id', Auth::id())->count();
            $now = Carbon::now()->addHours(3);
            $remainingtimes = [];

            // Loop through each plan to calculate the remaining time
            foreach ($notifications as $item) {
                $to = Carbon::parse($item->created_at);
                $diff = $now->diff($to);
                $remainingtimes[] = $diff->format(' %d days, %h hours, %i minutes, %s seconds');

            }

            return view('profile.myprofile', ['Notifications' => $notifications, 'count' => $count, 'remainingtimes' => $remainingtimes]);
        } else {
            return view('profile.myprofile');
        }
    }
}