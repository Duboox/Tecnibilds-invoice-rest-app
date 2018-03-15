<?php

namespace Tbappback\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image as Image;

use Tbappback\Customer;
use Tbappback\User;
use Tbappback\Notifications\NotifyUsersCustomer;

class CustomerController extends Controller
{
    public function index()
    {
        $customer = Customer::all();
        return response()
            ->json([
                'model' => $customer
            ]);
    }

    public function show($id)
    {
        $customer = Customer::findOrFail($id);
        $customer->created_at->diffForHumans();

        return response()
            ->json([
                'model' => $customer
            ]);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'last_name' => 'required',
            'picture' => 'required',
            'company' => 'required',
            'rif' => 'required',
            'email' => 'required|email',
            'phone' => 'required',
            'gender' => 'required',
            'address' => 'required',
        ]);

        if ($request->picture) {
            $explodedPic = explode(',', $request->picture);
            $decodedPic = base64_decode($explodedPic[1]);

            $pic = Image::make($decodedPic)->fit(500, 500, function ($constraint) {
                $constraint->upsize();
            })->encode('jpg', 75);
            $fileName = str_random().'.jpg';

            /* Usa el disco "employee_pictures" ubicado en "config/filesystems.php" */
            Storage::disk('customer_pictures')->put($fileName, $pic);

            $requestData = $request->all();
            $requestData['picture'] = $fileName;
        } else {
            $requestData['picture'] = "default.jpg";
        }

        $customer = Customer::create($requestData);

        /* NOTIFY USER */
        $users = User::all();
        foreach ($users as $user) {
            $user->Notify(new NotifyUsersCustomer($customer));
        }

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
            'company' => 'required',
            'rif' => 'required',
            'email' => 'required|email',
            'phone' => 'required',
            'gender' => 'required',
            'address' => 'required',
        ]);

        if(! Storage::disk('customer_pictures')->exists($request->picture)){
            $customerPic = Customer::findOrFail($id)->picture;
            if ($customerPic <> "default.jpg") {
                Storage::disk('customer_pictures')->delete($customerPic);
            }
            $explodedPic = explode(',', $request->picture);
            if (base64_decode($explodedPic[1], true)) {
                $decodedPic = base64_decode($explodedPic[1]);
                $pic = Image::make($decodedPic)->fit(500, 500, function ($constraint) {
                    $constraint->upsize();
                })->encode('jpg', 75);

                $fileName = str_random().'.jpg';
                Storage::disk('customer_pictures')->put($fileName, $pic);
                $requestData = $request->all();
                $requestData['picture'] = $fileName;
            }
        } else {
            $requestData = $request->all();
        }

        $customer = Customer::findOrFail($id);
        $customer->update($requestData);

        return response()
            ->json([
                'saved' => true
            ]);
    }

    public function destroy($id)
    {
        $customer = Customer::findOrFail($id);
        $customerPic = $customer->picture;
        if ($customerPic <> "default.jpg") {
            Storage::disk('customer_pictures')->delete($customerPic);
        }

        // TODo: delete customer's invoices first

        $customer->delete();

        return response()
            ->json([
                'deleted' => true
            ]);
    }
}
