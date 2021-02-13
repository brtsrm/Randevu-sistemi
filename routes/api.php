<?php

use App\Http\Controllers\api\admin\apiController;
use App\Http\Controllers\api\indexController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(["namespace" => "api"], function () {
    Route::get("/working-hours/{date?}", [indexController::class, "getWorkingHours"]);
    Route::post("/appointment-store", [indexController::class, "appointmentStore"]);
    Route::post("/working-store", [indexController::class, "getWorkingStore"]);
    Route::get("/working-list", [indexController::class, "getWorkingList"]);

    Route::group(["namespace" => "admin", "prefix" => "admin"], function () {
        Route::post("/process", [indexController::class, "process"]);
        Route::get("/all", [apiController::class, "all"]);
        Route::get("/list", [apiController::class, "getList"]);
        Route::get("/list-today", [apiController::class, "getToDayList"]);
        Route::get("/list-lastday", [apiController::class, "getLastDayList"]);
        Route::get("/waiting-list", [apiController::class, "getWaitingList"]);
    });

});
