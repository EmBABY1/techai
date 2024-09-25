<?php

namespace App\Http\Controllers\OpenCV;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class FaceRecognitionController extends Controller
{
    public function index()
    {
        return view('opencv.facerecognition');
    }
    public function detectFaces(Request $request)
    {
        // مسار الصورة المرفوعة
        $imagePath = $request->file('image')->getPathName();

        // تشغيل سكربت Python
        $command = escapeshellcmd("python C:/xampp\htdocs\Project_website\python_codes/face_recognition.py " . $imagePath);
        $output = shell_exec($command);
        // تحويل النتيجة إلى عدد الوجوه
        $numFaces = intval($output);
        // إرجاع عدد الوجوه
        return redirect()->back()->with('numFaces', $numFaces);
    }
}