<?php

namespace App\Http\Controllers\OpenCV;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class OcrController extends Controller
{
    public function index()
    {
        return view('opencv.ocr');
    }
    public function extractText(Request $request)
    {
        // مسار الصورة المرفوعة
        $imagePath = $request->file('image')->getPathName();

        // تشغيل سكربت Python لاستخراج النص
        $command = escapeshellcmd("python C:/xampp/htdocs/Project_website/python_codes/ocr.py " . $imagePath);
        $output = shell_exec($command);

        // قص المسافة البيضاء والنقاط من النص المستخرج
        $extractedText = trim($output);

        // تخزين النص المستخرج في الجلسة
        $request->session()->flash('extracted_text', $extractedText);

        // إعادة توجيه المستخدم لعرض النص المستخرج
        return redirect()->back();
    }
}