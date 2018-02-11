<?php

namespace Tbappback\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image as Image;

use Tbappback\Employee;

class EmployeeController extends Controller
{
    public function index()
    {
        $employees = Employee::all();
        return response()
            ->json([
                'model' => $employees
            ]);
    }

    public function show($id)
    {
        $employee = Employee::findOrFail($id);
        $employee->created_at->diffForHumans();

        return response()
            ->json([
                'model' => $employee
            ]);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'last_name' => 'required',
            'picture' => 'required',
            'address' => 'required',
            'phone' => 'required',
            'gender' => 'required',
            'email' => 'required',
            'position' => 'required',
            'salary' => 'required',
        ]);

        if ($request->picture) {
            $explodedPic = explode(',', $request->picture);
            $decodedPic = base64_decode($explodedPic[1]);

            $pic = Image::make($decodedPic)->fit(500, 500, function ($constraint) {
                $constraint->upsize();
            })->encode('jpg', 75);
            $fileName = str_random().'.jpg';

            /* Usa el disco "employee_pictures" ubicado en "config/filesystems.php" */
            Storage::disk('employee_pictures')->put($fileName, $pic);

            $requestData = $request->all();
            $requestData['picture'] = $fileName;
        } else {
            $requestData['picture'] = "default.png";
        }

        $employee = Employee::create($requestData);

        return response()
            ->json([
                'saved' => true
            ]);
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required',
            'last_name' => 'required',
            'picture' => 'required',
            'address' => 'required',
            'phone' => 'required',
            'gender' => 'required',
            'email' => 'required',
            'position' => 'required',
            'salary' => 'required',
        ]);

        if(! Storage::disk('employee_pictures')->exists($request->picture)){
            $employeePic = Employee::findOrFail($id)->picture;
            if ($employeePic <> "default.jpg") {
                Storage::disk('employee_pictures')->delete($employeePic);
            }
            $explodedPic = explode(',', $request->picture);
            if (base64_decode($explodedPic[1], true)) {
                $decodedPic = base64_decode($explodedPic[1]);
                $pic = Image::make($decodedPic)->fit(500, 500, function ($constraint) {
                    $constraint->upsize();
                })->encode('jpg', 75);

                $fileName = str_random().'.jpg';
                Storage::disk('employee_pictures')->put($fileName, $pic);
                $requestData = $request->all();
                $requestData['picture'] = $fileName;
            }
        } else {
            $requestData = $request->all();
        }

        $employee = Employee::findOrFail($id);
        $employee->update($requestData);

        return response()
            ->json([
                'saved' => true
            ]);
    }

    public function destroy($id)
    {
        $employee = Employee::findOrFail($id);
        $employeePic = $employee->picture;
        if ($employeePic <> "default.jpg") {
            Storage::disk('employee_pictures')->delete($employeePic);
        }
        $employee->delete();

        return response()
            ->json([
                'deleted' => true
            ]);
    }
}
