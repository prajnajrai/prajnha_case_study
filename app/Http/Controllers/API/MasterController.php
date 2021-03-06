<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Category;
use App\Models\Avatar;
use App\Models\Product;
use Exception;

/**
 * Add Master data.
 * This is to manage category, avatar, product masters
 *
 * @author Prajnha J Rai <prajna.adyanthaya@gmail.com>
 */
class MasterController extends Controller
{

	/**
     * Create category master.
     *
     * @param Request $request
     */
	public function createCategory(Request $request) {
		try {
			$validatedData = $request->validate([
				'category' => 'required|string|max:255',
			]);

		    $category = Category::create([
	          	'category' => $validatedData['category'],
		    ]);

		    return response()->json(['success' => 'success'], 200);
		} catch (Exception $e) {
			return response()->json(['error' => 'Sorry! Server Error'], 500);
		}
	}

	/**
     * Create Avatar master.
     *
     * @param Request $request
     */
	public function createAvatar(Request $request) {
		try {
			$validatedData = $request->validate([
				'avatar' => 'required|string|max:255',
			]);

		    $avatar = Avatar::create([
	          	'avatar' => $validatedData['avatar'],
		    ]);

		    return response()->json(['success' => 'success'], 200);
		} catch (Exception $e) {
			return response()->json(['error' => 'Sorry! Server Error'], 500);
		}
	}

	/**
     * Create product master.
     *
     * @param Request $request
     */
	public function createProduct(Request $request) {
		try {
			$validatedData = $request->validate([
				'avatar_id' => 'required|numeric',
				'category_id' => 'required|numeric',
				'name' => 'required|string|max:255',
				'price' => 'required|numeric',
				'description' => 'required|max:255',
			]);

		    $product = Product::create([
		    	'avatar_id' => $validatedData['avatar_id'],
		    	'category_id' => $validatedData['category_id'],
		    	'name' => $validatedData['name'],
		    	'price' => $validatedData['price'],
	          	'description' => $validatedData['description'],
		    ]);

		    return response()->json(['success' => 'success'], 200);
		} catch (Exception $e) {
			return response()->json(['error' => 'Sorry! Server Error'], 500);
		}
	}

	/**
     * Get Product List.
     *
     * @param Request $request
     *
     * @return App\Models\Product
     */
	public function getProducts(Request $request) {
		$products = Product::get();
		return response()->json(['products' => $products], 200);
	}

	/**
     * Get Single Product details.
     *
     * @param int $id
     *
     * @return App\Models\Product
     */
	public function getProductDetails($id = null) {
		$product = Product::join('categories', 'categories.id', 'products.category_id')
		->join('avatars', 'avatars.id', 'products.avatar_id')->select('products.*', 'avatars.avatar', 'categories.category')->where('products.id', $id)->first();
		return response()->json(['product' => $product], 200);
	}

	/**
     * Get Product List.
     *
     * @param int $id
     */
	public function deleteProduct($id) {
		Product::where('id', $id)->delete();
		$products = Product::get();
		return response()->json(['products' => $products], 200);
	}
}