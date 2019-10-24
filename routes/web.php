<?php
use Illuminate\Support\Str ;

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->get('/key', function() {
    return Str::random(32);
});

$router->group(['prefix' => 'mahasiswa'], function () use ($router) {
    $router->post('show', 'MahasiswaController@show');
    $router->post('detail', 'MahasiswaController@detail');
    $router->post('insert', 'MahasiswaController@insert');
    $router->post('update', 'MahasiswaController@update');
    $router->post('delete', 'MahasiswaController@delete');
});
