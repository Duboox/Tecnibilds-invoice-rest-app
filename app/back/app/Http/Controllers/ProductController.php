<?php

namespace Tbappback\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image as Image;
use Tbappback\Product;
use Tbappback\User;
class ProductController extends Controller
{
    public function index()
    {
        $products = Product::with('user')->get();
        return response()
            ->json([
                'model' => $products
            ]);
    }

    public function show($id)
    {
        $product = Product::findOrFail($id);
        $product->created_at->diffForHumans();

        return response()
            ->json([
                'model' => $product
            ]);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'cod' => 'required',
            'name' => 'required',
            'brand' => 'required',
            'rating' => 'required',
            'picture' => 'required',
            'stock' => 'required',
            'description' => 'required',
            'unit_price' => 'required',
        ]);

        if ($request->picture) {
            $explodedPic = explode(',', $request->picture);
            $decodedPic = base64_decode($explodedPic[1]);

            $pic = Image::make($decodedPic)->fit(500, 500, function ($constraint) {
                $constraint->upsize();
            })->encode('jpg', 75);
            $fileName = str_random().'.jpg';

            /* Usa el disco "product_pictures" ubicado en "config/filesystems.php" */
            Storage::disk('product_pictures')->put($fileName, $pic);

            $requestData = $request->all();
            $requestData['picture'] = $fileName;
        } else {
            $requestData['picture'] = "default.png";
        }

        $product = Product::create($requestData);

        return response()
            ->json([
                'saved' => true
            ]);
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'cod' => 'required',
            'name' => 'required',
            'brand' => 'required',
            'rating' => 'required',
            'stock' => 'required',
            'description' => 'required',
            'unit_price' => 'required',
        ]);

        if(! Storage::disk('product_pictures')->exists($request->picture)){
            $productPic = Product::findOrFail($id)->picture;
            if ($productPic <> "default.png") {
                Storage::disk('product_pictures')->delete($productPic);
            }
            $explodedPic = explode(',', $request->picture);
            if (base64_decode($explodedPic[1], true)) {
                $decodedPic = base64_decode($explodedPic[1]);
                $pic = Image::make($decodedPic)->fit(500, 500, function ($constraint) {
                    $constraint->upsize();
                })->encode('jpg', 75);

                $fileName = str_random().'.jpg';
                Storage::disk('product_pictures')->put($fileName, $pic);
                $requestData = $request->all();
                $requestData['picture'] = $fileName;
            }
        } else {
            $requestData = $request->all();
        }

        $product = Product::findOrFail($id);
        $product->update($requestData);

        return response()
            ->json([
                'saved' => true
            ]);
    }

    public function destroy($id)
    {
        $product = Product::findOrFail($id);

        $productPic = $product->picture;
        if ($productPic <> "default.png") {
            Storage::disk('product_pictures')->delete($productPic);
        }
        $product->delete();

        return response()
            ->json([
                'deleted' => true
            ]);
    }
}
