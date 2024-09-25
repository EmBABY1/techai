<?php

namespace App\Http\Controllers;

use App\Models\News;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class NewsController extends Controller
{
    public function index()
    {
        $news = News::all();

        return view('admin.news', ['news' => $news]);
    }

    public function destroy($id)
    {
        DB::table('news')->where('id', $id)->delete();
        $result = DB::table('users')->get();

        return redirect()->back()->with('msg', 'News deleted successfully');
    }

    public function insert(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'body' => 'required|string|min:1',
            'photo' => 'required|file|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $result = DB::select('select * from news where title = ?', [$request->title]);
        if ($result) {
            $msg = 'this news has been added before';

            return redirect()->route('adminpannel')->with('success1', $msg);
        } else {
            $msg = 'the news has been added successfully';
            $photo = $request->photo;
            $title = $request->title;
            $body = $request->body;
            $path = 'assets/img/news/';
            $file_extension = $photo->getClientOriginalExtension();
            $filename = $title.'.'.$file_extension;
            $request->photo->move($path, $filename);
            $photo = $path.$filename;
            $news = News::create([
                'title' => $title,
                'body' => $body,
                'photo' => $photo,
            ]);

            return redirect()->back()->with('msg', $msg);
        }
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'body' => 'required|string|min:2',
        ]);

        $news = News::findOrFail($id);

        // Update news data
        $title = $request->title;
        $body = $request->body;
        $photo = $request->photo;
        $path = 'assets/img/news/';
        $file_extension = $photo->getClientOriginalExtension();
        $filename = $title.'.'.$file_extension;
        $request->photo->move($path, $filename);
        $photo = $path.$filename;
        $news->title = $title;
        $news->photo = $photo;
        $news->body = $body;
        // Save the updated news data
        $news->save();

        return redirect()->back()->with('msg', 'News updated successfully');
    }
}
