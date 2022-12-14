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

Route::get('/books', [\App\Http\Controllers\BooksController::class, 'index']);
Route::get('/books/create', [\App\Http\Controllers\BooksController::class, 'create']);
Route::post('/books', [\App\Http\Controllers\BooksController::class, 'store']);
Route::delete('/books/{id}', [\App\Http\Controllers\BooksController::class, 'destroy']);
