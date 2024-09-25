<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class CommentController extends Controller
{
    public function index()
    {
        $comment = Comment::all();

        return view('admin.comment', ['comments' => $comment]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'content' => 'required|max:255',
        ]);

        Comment::create([
            'content' => $request->content,
            'user_id' => Auth::id(),
        ]);

        return redirect()->back()->with('msg', 'Comment posted successfully!');
    }

    public function showComments()
    {
        $comments = Comment::with('user')->latest()->get();

        return view('welcome', compact('comments'));
    }

    public function destroy($id)
    {
        DB::table('comments')->where('id', $id)->delete();
        $result = DB::table('users')->get();

        return redirect()->back()->with('msg', 'Comment deleted successfully!');
    }
}