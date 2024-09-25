<?php

namespace App\Http\Controllers;

use App\Models\About;
use App\Models\Comment;
use App\Models\Services;
use Illuminate\Support\Facades\DB;

class WelcomeController extends Controller
{
    public function index()
    {
        $packages = DB::table('packages')->get();
        $news = DB::table('news')->get();
        $comment = Comment::with('user')->latest()->get();
        $about = About::all();
        $services = Services::all();

        return view('welcome', ['packages' => $packages, 'news' => $news, 'comments' => $comment,
            'about' => $about, 'services' => $services]);
    }
}
