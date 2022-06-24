<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Cart;
use Exception;
use Auth;

class CartController extends Controller
{
	public function addToCart(Request $request) {
		// try {
			$validatedData = $request->validate([
				'product_id' => 'required|numeric',
				'session_id' => 'required|max:255',
				'qty' => 'required|numeric',
			]);

			$userID = Auth('sanctum')->user() ? Auth('sanctum')->user()->id : null;
			
			if($userID) {
				$sessionId = null;
				$cart = Cart::where('user_id', $userID)
					->where('product_id', $validatedData['product_id'])
					->update([ 'qty' => $validatedData['qty'], 
						'session_id' => null ]);
			} else {
				$sessionId = $validatedData['session_id'];
				$cart = Cart::where('session_id', $validatedData['session_id'])
					->where('product_id', $validatedData['product_id'])
					->update(['qty' => $validatedData['qty']]);
			}

			if(!$cart) {
				$cart = Cart::create([
			    	'product_id' => $validatedData['product_id'],
			    	'session_id' => $sessionId,
			    	'qty' => $validatedData['qty'],
			    	'user_id' => $userID,
	    		]);
			}

			$data = $this->getCartItems($request);
			return response()->json(['data' => $data], 200);

		// } catch (Exception $e) {
		// 	return response()->json(['error' => 'Sorry! Server Error'], 500);
		// }
	}

	public function updateCart(Request $request, $id) {
		$validatedData = $request->validate([
			'qty' => 'required|numeric',
		]);

		$userID = Auth('sanctum')->user() ? Auth('sanctum')->user()->id : null;
		if($userID) {
			Cart::where('id', $id)->where('user_id', $userID)
			->update([ 'qty' => $validatedData['qty']]);
		} else {
			Cart::where('id', $id)->where('session_id', $request->session_id)
			->update([ 'qty' => $validatedData['qty']]);
		}

		$data = $this->getCartItems($request);
		return response()->json(['data' => $data], 200);
	}

	public function deleteCart(Request $request, $id) {
		$userID = Auth('sanctum')->user() ? Auth('sanctum')->user()->id : null;
		if($userID) {
			Cart::where('id', $id)->where('user_id', $userID)->delete();
		} else {
			Cart::where('id', $id)->where('session_id', $request->session_id)->delete();
		}
		
		$data = $this->getCartItems($request);
		return response()->json(['data' => $data], 200);
	}

	public function getCart(Request $request) {
		$data = $this->getCartItems($request);
		return response()->json(['data' => $data], 200);
	}

	public function getCartItems(Request $request) {
		$userID = Auth('sanctum')->user() ? Auth('sanctum')->user()->id : null;
		if($userID) {
			$productIdInSession = Cart::where('session_id', $request->session_id)->pluck('product_id')->toArray();
			$productIdInCart = Cart::whereIn('product_id', $productIdInSession)->where('user_id', $userID)->delete();
			Cart::where('session_id', $request->session_id)
				->update([ 'session_id' => null, 'user_id' => $userID ]);
			$cart = Cart::where('user_id', $userID)->get();
		} else {
			$cart = Cart::where('session_id', $request->session_id)->get();
		}

		return $cart;
	}
}