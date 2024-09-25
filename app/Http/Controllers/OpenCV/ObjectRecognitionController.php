<?php

namespace App\Http\Controllers\OpenCV;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ObjectRecognitionController extends Controller
{
    public function index()
    {
        return view('opencv.object_recognition');
    }
    public function detect(Request $request)
    {
        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        $image = $request->file('image');
        $imagePath = $image->store('images', 'public');

        $imageFullPath = storage_path('app/public/' . $imagePath);
        $pythonScript = 'C:/xampp/htdocs/Project_website/python_codes/object_detection.py';
        $command = escapeshellcmd("python $pythonScript $imageFullPath");
        exec($command, $output, $retval);

        if ($retval == 0) {
            // تأكد من أن الإخراج هو مسار الصورة المعالجة
            $outputPath = 'images/detected.jpg';
            return redirect()->back()->with('output', $outputPath);
        } else {
            return back()->withErrors(['error' => 'Object detection failed.']);
        }
    }
}