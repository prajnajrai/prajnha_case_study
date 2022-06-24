<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\MasterController;
use App\Http\Controllers\API\CartController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['middleware' => ['throttle:api','authapi']], function() {

	Route::post('/auth/register', [AuthController::class, 'register']);

	Route::post('/auth/login', [AuthController::class, 'login']);

	Route::group(['middleware' => ['auth:sanctum','admin']], function() {
		/* There APIs are accessed by Only existing Admins */
		Route::post('avatars', [MasterController::class, 'createAvatar']);
		Route::post('categories', [MasterController::class, 'createCategory']);
		Route::post('products', [MasterController::class, 'createProduct']);
		Route::delete('products/{id}', [MasterController::class, 'deleteProduct']);
	});

	/* There APIs can access by the guest or users */
	Route::get('products', [MasterController::class, 'getProducts']);
	Route::get('products/{id}', [MasterController::class, 'getProductDetails']);
	Route::post('cart', [CartController::class, 'addToCart']);
	Route::put('cart/{id}', [CartController::class, 'updateCart']);
	Route::delete('cart/{id}', [CartController::class, 'deleteCart']);
	Route::get('cart', [CartController::class, 'getCart']);
});