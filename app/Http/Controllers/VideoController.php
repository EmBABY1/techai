<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Symfony\Component\Process\Process;
use Symfony\Component\Process\Exception\ProcessFailedException;

class VideoController extends Controller
{
    public function index()
    {
        return view('uploadvideo');
    }
    public function upload(Request $request)
    {
        $request->validate([
            'video' => 'required|mimes:mp4,avi,mov|max:20480', // 20MB max
        ]);

        $videoPath = $request->file('video')->store('videos');
        $scriptPath = base_path('app/scripts/face_detection.py');
        $fullVideoPath = storage_path('app/' . $videoPath);

        // Ensure paths are properly escaped for Windows
        $scriptPath = escapeshellarg($scriptPath);
        $fullVideoPath = escapeshellarg($fullVideoPath);

        $process = new Process(['python', $scriptPath, $fullVideoPath]);
        $process->run();

        if (!$process->isSuccessful()) {
            throw new ProcessFailedException($process);
        }

        $faceCount = trim($process->getOutput());

        return response()->json([
            'message' => 'Video processed successfully.',
            'face_count' => $faceCount,
        ]);
    }
}