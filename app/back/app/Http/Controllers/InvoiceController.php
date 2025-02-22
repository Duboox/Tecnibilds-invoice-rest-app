<?php

namespace Tbappback\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;

use Tbappback\Invoice;
use Tbappback\InvoiceItem;
use Tbappback\Customer;
use Tbappback\Notifications\NotifyUsersInvoice;
use Tbappback\Product;
use Tbappback\User;

// DELETE THIS
use Illuminate\Support\Facades\Mail;
use Tbappback\Mail\InvoiceCreated;

use Nexmo\Laravel\Facade\Nexmo;

class InvoiceController extends Controller
{
    public function index()
    {
        $invoices = Invoice::with('customer')->get();
        return response()
            ->json([
                'model' => $invoices
            ]);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'customer_id' => 'required|exists:customers,id',
            'number' => 'required|numeric|min:0',
            'status' => 'required|numeric|min:0',
            'title' => 'required',
            'date' => 'required|date_format:Y-m-d',
            'due_date' => 'required|date_format:Y-m-d',
            'iva_percent' => 'required|numeric|min:0',
            'discount' => 'required|numeric|min:0',
            'items' => 'required|array|min:1',
            'items.*.product_id' => 'required|numeric|min:1',
            'items.*.qty' => 'required|integer|min:1',
        ]);

        $data = $request->except('items');
        $data['sub_total'] = 0;
        $items = [];

        foreach ($request->items as $item) {
            $product = Product::where('id', $item['product_id'])->first();
            $data['sub_total'] =+ $product->unit_price * $item['qty'];
            $items[] = new InvoiceItem($item);
        }

        $data['iva'] = ( $data['sub_total'] * $data['iva_percent'] ) / 100;
        $data['total'] = ($data['sub_total'] + $data['iva']) - $data['discount'];

        $invoice = Invoice::create($data);

        $invoice->items()
            ->saveMany($items);

        /* NOTIFY USER */
        $users = User::all();
        foreach ($users as $user) {
            $user->Notify(new NotifyUsersInvoice($invoice));
        }

        /* SMS NOTIFY */
        Nexmo::message()->send([
            'to'   => '584242336927',
            'from' => 'NEXMO',
            'text' => 'Han creado una nueva factura en Tecnibilds! - '
        ]);

        return response()
            ->json([
                'saved' => true
            ]);
    }

    public function show($id)
    {
        $invoice = Invoice::with('customer', 'items')->findOrFail($id);
        $products = Product::orderBy('id')->get();

        return response()
            ->json([
                'model' => $invoice,
                'products' => $products
            ]);
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'customer_id' => 'required|exists:customers,id',
            'number' => 'required|numeric|min:0',
            'status' => 'required|numeric|min:0',
            'title' => 'required',
            'date' => 'required|date_format:Y-m-d',
            'due_date' => 'required|date_format:Y-m-d',
            'discount' => 'required|numeric|min:0',
            'items' => 'required|array|min:1',
            'items.*.product_id' => 'required|numeric|min:0',
            'items.*.qty' => 'required|integer|min:1',
        ]);

        $invoice = Invoice::findOrFail($id);

        $data = $request->except('items');
        $data['sub_total'] = 0;
        $items = [];
        $itemsIds = [];

        foreach ($request->items as $item) {
            $ProductItem = Product::findOrFail($item['product_id']);
            $data['sub_total'] +=  $ProductItem->unit_price * $item['qty'];
            if(isset($item['id'])) {
                // Update the item
                InvoiceItem::whereId($item['id'])
                    ->whereInvoiceId($invoice->id)
                    ->update($item);

                $itemsIds[] = $item['id'];
            } else {
                $item['invoice_id'] = $invoice->id;
                $items[] = new InvoiceItem($item);
            }
        }

        $data['iva'] = ($data['sub_total'] * $data['iva_percent']) / 100;
        $data['total'] = ($data['sub_total'] + $data['iva']) - $data['discount'];

        $invoice->update($data);

        // Delete removed items

        if(count($itemsIds)) {
            InvoiceItem::whereInvoiceId($invoice->id)
                ->whereNotIn('id', $itemsIds)
                ->delete();
        }

        if(count($items)) {
            $invoice->items()
                ->saveMany($items);
        }

//        TESTING HERE DELETE
        $Updatedinvoice = Invoice::findOrFail($invoice->id);
        Mail::to($request->user())
            ->send(new InvoiceCreated($Updatedinvoice));
//            ->cc(['joshua@tecnibilds.com.ve'])


        return response()
            ->json([
                'saved' => true
            ]);
    }

    public function destroy($id)
    {
        $invoice = Invoice::findOrFail($id);

        InvoiceItem::whereInvoiceId($invoice->id)
            ->delete();

        $invoice->delete();

        return response()
            ->json([
                'deleted' => true
            ]);

    }
}
