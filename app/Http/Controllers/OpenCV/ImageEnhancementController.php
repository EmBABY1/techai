<?php

namespace App\Http\Controllers\OpenCV;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;

class ImageEnhancementController extends Controller
{
    public function index()
    {
        return view('opencv.enhanceimg');
    }
    public function enhanceImage(Request $request)
    {
        $image = $request->file('image');
        $imagePath = $image->store('images', 'public');
        $imageFullPath = storage_path('app/public/' . $imagePath);
        $command = escapeshellcmd("python C:/xampp\htdocs\Project_website\python_codes/enhance_image.py " . $imageFullPath);
        $output = shell_exec($command);
        $output = trim($output);
        // تخزين المسار في الجلسة
        $enhancedImagePath = public_path('images/enhanced_image.jpg');
        File::copy($output, $enhancedImagePath);

        // Store the path in the session
        $request->session()->flash('enhanced_image', asset('images/enhanced_image.jpg'));

        return redirect()->back();

    }
}