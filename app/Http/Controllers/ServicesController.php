<?php

namespace App\Http\Controllers;

use App\Models\Services;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class ServicesController extends Controller
{
    public function index()
    {
        $services = Services::all();

        return view('admin.services', ['services' => $services]);
    }

    public function destroy($id)
    {
        DB::table('services')->where('id', $id)->delete();
        $result = DB::table('users')->get();

        return redirect()->back()->with('msg', 'service deleted successfully');
    }

    public function insert(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'photo' => 'required|file|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $path = 'assets/img/services/';
        $service = $request->service;
        $photo = $request->photo;
        $file_extension = $photo->getClientOriginalExtension();
        $filename = $service.'.'.$file_extension;
        $request->photo->move($path, $filename);
        $photo = $path.$filename;
        $services = Services::create([
            'service' => $request->service,
            'photo' => $photo,
        ]);

        return redirect()->back()->with('msg', 'service inserted successfully');

    }

    public function update(Request $request, $id)
    {
        $services = Services::findOrFail($id);

        // Update about data

        $path = 'assets/img/services/';
        $service = $request->service;
        $photo = $request->photo;
        $file_extension = $photo->getClientOriginalExtension();
        $filename = $service.'.'.$file_extension;
        $request->photo->move($path, $filename);
        $photo = $path.$filename;
        $services->service = $request->service;
        $services->photo = $request->photo;
        // Save the updated user data
        $services->save();

        return redirect()->back()->with('msg', 'service updated successfully');

    }
}
