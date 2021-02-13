<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class IndexController extends Controller
{
 
    public function index(){
        return view("admin.index");
    }
    public function working(){
        return view("admin.working");
    }

}
