<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Illuminate\Validation\Rules\Password;

class UserController extends Controller
{
    public function index()
    {
        $users = User::all();

        return view('admin.user', ['users' => $users]);
    }

    public function destroy($id)
    {
        DB::table('users')->where('id', $id)->delete();

        $result = DB::table('users')->get();

        return redirect()->back()->with('msg', 'user deleted successfully');
    }

    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {

        $res = DB::select('select * from users where email = ?', [$request->email]);
        if ($res) {
            $msg = ' this email has been added before';

            return redirect()->back()->with('msg', $msg);
        } else {
            $msg = '  email has been added successfuly';
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password),
                'role_as' => $request->role_as,
            ]);

            return redirect()->back()->with('msg', $msg);
        }
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => [
                'required',
                'string',
                'email',
                'max:255',
                Rule::unique('users')->ignore($id),
            ],
            'password' => 'nullable|string|min:6',
            'role_as' => 'required|string|max:255',
        ]);

        // Find the user by ID
        $user = User::findOrFail($id);

        // Update user data
        $user->name = $request->name;
        $user->email = $request->email;
        $user->role_as = $request->role_as;

        // Hash and update the password if provided
        if ($request->password) {
            $user->password = Hash::make($request->password);
        }

        // Save the updated user data
        $user->save();

        return redirect()->back()->with('msg', 'User updated successfully');
    }
}
