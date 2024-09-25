<?php

namespace App\Http\Controllers;

use App\Models\Contactus;
use App\Models\User;
use App\Notifications\YouHaveNewComplain;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Notification;

class ContactusController extends Controller
{
    public function index()
    {
        $contactus = Contactus::all();

        return view('admin.complain', ['complains' => $contactus]);
    }

    public function contactus(Request $request)
    {
        $created_at = Carbon::now();
        $created_at = $created_at->toDateTimeString();
        $contact = Contactus::Create([
            'name' => $request->name,
            'email' => $request->email,
            'subject' => $request->subject,
            'message' => $request->message,
        ]);
        // Fetch admin user(s)
        $admin = User::where('role_as', 'admin')->get();
        // Notify admin(s)
        Notification::send($admin, new YouHaveNewComplain($contact));

        return redirect()->back()->with('msg', 'Message Has Been Sent Thank You');
    }

    public function destroy($id)
    {
        DB::table('contactus')->where('id', $id)->delete();
        $result = DB::table('users')->get();
        $msg = 'message has been deleted.';

        return redirect()->back()->with('msg', $msg);
    }
}
