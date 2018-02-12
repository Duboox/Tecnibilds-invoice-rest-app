<?php

namespace Tbappback\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image as Image;

use Tbappback\Provider;


class ProviderController extends Controller
{
    public function index()
    {
        $providers = Provider::all();
        return response()
            ->json([
                'model' => $providers
            ]);
    }

    public function show($id)
    {
        $provider = Provider::findOrFail($id);
        $provider->created_at->diffForHumans();

        return response()
            ->json([
                'model' => $provider
            ]);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'last_name' => 'required',
            'picture' => 'required',
            'company' => 'required',
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
            Storage::disk('provider_pictures')->put($fileName, $pic);

            $requestData = $request->all();
            $requestData['picture'] = $fileName;
        } else {
            $requestData['picture'] = "default.jpg";
        }

        $provider = Provider::create($requestData);

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
            'email' => 'required|email',
            'phone' => 'required',
            'gender' => 'required',
            'address' => 'required',
        ]);

        if(! Storage::disk('provider_pictures')->exists($request->picture)){
            $providerPic = Provider::findOrFail($id)->picture;
            if ($providerPic <> "default.jpg") {
                Storage::disk('provider_pictures')->delete($providerPic);
            }
            $explodedPic = explode(',', $request->picture);
            if (base64_decode($explodedPic[1], true)) {
                $decodedPic = base64_decode($explodedPic[1]);
                $pic = Image::make($decodedPic)->fit(500, 500, function ($constraint) {
                    $constraint->upsize();
                })->encode('jpg', 75);

                $fileName = str_random().'.jpg';
                Storage::disk('provider_pictures')->put($fileName, $pic);
                $requestData = $request->all();
                $requestData['picture'] = $fileName;
            }
        } else {
            $requestData = $request->all();
        }

        $provider = Provider::findOrFail($id);
        $provider->update($requestData);

        return response()
            ->json([
                'saved' => true
            ]);
    }

    public function destroy($id)
    {
        $provider = Provider::findOrFail($id);
        $providerPic = $provider->picture;
        if ($providerPic <> "default.jpg") {
            Storage::disk('provider_pictures')->delete($providerPic);
        }
        $provider->delete();

        return response()
            ->json([
                'deleted' => true
            ]);
    }
}
