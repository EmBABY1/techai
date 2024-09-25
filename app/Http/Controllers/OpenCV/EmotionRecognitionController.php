<?php

namespace App\Http\Controllers\OpenCV;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Http;
use Symfony\Component\Process\Process;
use Symfony\Component\Process\Exception\ProcessFailedException;

class EmotionRecognitionController extends Controller
{

    public function index()
    {
        return view('opencv.emotion_recognition');
    }
    public function detectEmotion(Request $request)
    {
        // Validate the incoming request
        $request->validate([
            'image' => 'required|image',
        ]);
    
        // Store the image and get the path
        $path = $request->file('image')->store('images', 'public');
        $imagePath = storage_path('app/public/' . $path);
    
        // Define the path to the Python script
        $pythonScriptPath = 'C:/xampp/htdocs/Project_website/python_codes/emotion_recognition.py';
    
        // Escape the paths to prevent issues with spaces or special characters
        $escapedPythonScriptPath = escapeshellarg($pythonScriptPath);
        $escapedImagePath = escapeshellarg($imagePath);
    
        // Build the command to run the Python script and redirect stderr to stdout
        $command = "python $escapedPythonScriptPath $escapedImagePath 2>&1";
    
        // Execute the command and capture the output
        $output = [];
        $returnVar = 0;
        exec($command, $output, $returnVar);
    
        // Capture the entire output for debugging
        $fullOutput = implode("\n", $output);
    
        // Log the command, output, and return status for debugging
        \Log::info('Command executed: ' . $command);
        \Log::info('Output: ' . $fullOutput);
        \Log::info('Return status: ' . $returnVar);
    
        // Check if the command was successful
        if ($returnVar !== 0 || empty($output)) {
            return response()->json(['error' => 'Failed to execute Python script', 'details' => $fullOutput], 500);
        }
    
        // Filter output to capture only the JSON part
        $jsonOutput = end($output);
        
        // Return the output from the script
        return  redirect()->back()->with(['emotions' => json_decode($jsonOutput)]);
    }
    
    
}