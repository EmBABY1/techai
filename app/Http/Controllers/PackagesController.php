<?php

namespace App\Http\Controllers;

use App\Models\Packages;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PackagesController extends Controller
{
    public function index()
    {
        $packages = Packages::all();

        return view('admin.package', ['packages' => $packages]);
    }

    public function destroy($id)
    {
        DB::table('packages')->where('id', $id)->delete();
        $result = DB::table('users')->get();

        return redirect()->back()->with('msg', 'package deleted succeessfully');
    }

    public function insert(Request $request)
    {

        $result = DB::select('select * from packages where name = ?', [$request->name]);
        if ($result) {
            $msg = 'this package has been added before';

            return redirect()->back()->with('msg', $msg);
        } else {
            $msg = 'the package has been added successfully';
            $package = Packages::create([
                'name' => $request->name,
                'duration' => $request->duration,
                'price' => $request->price,
                'description' => $request->description,
                'property2' => $request->property2,
                'property3' => $request->property3,
                'property4' => $request->property4,
            ]);

            return redirect()->back()->with('msg', 'package inserted successfully');
        }
    }

    public function update(Request $request, $id)
    {

        $package = Packages::findOrFail($id);

        // Update Package data
        $package->name = $request->name;
        $package->duration = $request->duration;
        $package->price = $request->price;
        $package->description = $request->description;
        $package->property2 = $request->property2;
        $package->property3 = $request->property3;
        $package->property4 = $request->property4;
        // Save the updated user data
        $package->save();

        return redirect()->back()->with('msg', 'package updated successfully');

    }
}