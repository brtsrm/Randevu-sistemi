<?php

use App\Http\Controllers\admin\IndexController as AdminIndexController;
use App\Http\Controllers\Front\IndexController;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Route::get('/', [IndexController::class, "index"]);
Route::prefix("cron")->group(function () {
    Route::get('/remider', function () {
        Artisan::call('Reminder:Start');
    });
});
Auth::routes();
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::namespace ("admin")->prefix("admin")->name("admin.")->middleware("auth")->group(function () {
    Route::get('/', [AdminIndexController::class, "index"])->name("index");
    Route::get('/working', [AdminIndexController::class, "working"])->name('working');
});
