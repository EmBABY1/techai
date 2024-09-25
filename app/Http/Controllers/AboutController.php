<?php

namespace App\Http\Controllers;

use App\Models\About;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AboutController extends Controller
{
    public function index()
    {
        $about = About::all();

        return view('admin.about', ['about' => $about]);

    }

    public function destroy($id)
    {
        DB::table('about')->where('id', $id)->delete();
        $result = DB::table('users')->get();

        return redirect()->back()->with('msg', 'about deleted successfully');
    }

    public function insert(Request $request)
    {
        $about = About::create([
            'title' => $request->title,
            'subject' => $request->subject,
            'subject2' => $request->subject2,
            'subject3' => $request->subject3,
            'subject4' => $request->subject4,
        ]);

        return redirect()->back()->with('msg', 'about inserted successfully');

    }

    public function update(Request $request, $id)
    {

        $about = About::findOrFail($id);

        // Update about data
        $about->title = $request->title;
        $about->subject = $request->subject;
        $about->subject2 = $request->subject2;
        $about->subject3 = $request->subject3;
        $about->subject4 = $request->subject4;
        // Save the updated user data
        $about->save();

        return redirect()->back()->with('msg', 'about updated successfully');

    }
}
