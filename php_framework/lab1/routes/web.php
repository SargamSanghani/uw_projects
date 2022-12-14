<?php

use App\Http\Controllers\PagesController;
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

Route::get('/', [PagesController::class, 'home']);

Route::get(
    'home',
    [PagesController::class, 'home']
);

Route::get(
    'about',
    [PagesController::class, 'about']
);

Route::get(
    'detail',
    [PagesController::class, 'detail']
);

Route::get(
    'contact',
    [PagesController::class, 'contact']
);

Route::get(
    'register',
    [PagesController::class, 'register']
);
