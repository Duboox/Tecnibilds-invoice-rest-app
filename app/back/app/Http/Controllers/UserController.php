<?php

namespace Tbappback\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image as Image;

use Tbappback\User;

class UserController extends Controller
{
    public function index()
    {
        $users = User::all();
        return response()
            ->json([
                'model' => $users
            ]);
    }

    public function show($id)
    {
        $user = User::findOrFail($id);
        Carbon::parse($user->created_at)->diffForHumans();
        $user->created_at->diffForHumans();

        return response()
            ->json([
                'model' => $user
            ]);
    }

    public function update(Request $request)
    {
        $this->validate($request, [
            'id' => 'required',
            'name' => 'required',
            'email' => 'required|email',
            'picture' => 'required',
        ]);

        if(! Storage::disk('user_pictures')->exists($request->picture)){
            $userPic = User::findOrFail($request->id)->picture;
            if ($userPic <> "default.jpg") {
                Storage::disk('user_pictures')->delete($userPic);
            }
            $explodedPic = explode(',', $request->picture);
            if (base64_decode($explodedPic[1], true)) {
                $decodedPic = base64_decode($explodedPic[1]);
                $pic = Image::make($decodedPic)->fit(500, 500, function ($constraint) {
                    $constraint->upsize();
                })->encode('jpg', 75);

                $fileName = str_random().'.jpg';
                Storage::disk('user_pictures')->put($fileName, $pic);
                $requestData = $request->all();
                $requestData['picture'] = $fileName;
            }
        } else {
            $requestData = $request->all();
        }

        $user = User::findOrFail($request->id);
        $user->update($requestData);

        return response()
            ->json([
                'saved' => true
            ]);
    }
}
