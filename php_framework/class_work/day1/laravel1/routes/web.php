<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/hello', function () {
    return "Hello, world!";
});


Route::get('goodbye', function () {
    $title = "Goodbye, Cruel World!";
    return view("goodbye", compact('title'));
});

Route::get('/hello/{name}', function ($name) {
    return view("hello", compact('name'));
});
