<?php

namespace App\Http\Controllers\api\admin;

use App\Http\Controllers\Controller;
use App\Models\Appointment;
use Illuminate\Support\Facades\DB;

class apiController extends Controller
{
    public function all(){
        
        $data["waiting"] = Appointment::with("workingHous")->select("*", DB::raw("DATE_FORMAT(date,'%d.%m.%Y') as tarih"))->where("isStatu",0)->orderBy('created_at', "desc")->paginate(5);;
        $data["list"]    = Appointment::with("workingHous")->select("*", DB::raw("DATE_FORMAT(date,'%d.%m.%Y') as tarih"))->where("date", ">", date("Y-m-d"))->orderBy('date', "asc")->paginate(5);
        $data["today"]   = Appointment::with("workingHous")->select("*", DB::raw("DATE_FORMAT(date,'%d.%m.%Y') as tarih"))->where("date", "=", date("Y-m-d"))->orderBy('created_at', "desc")->paginate(5);
        $data["last"]    = Appointment::with("workingHous")->select("*", DB::raw("DATE_FORMAT(date,'%d.%m.%Y') as tarih"))->where("date", "<", date("Y-m-d"))->orderBy('created_at', "desc")->paginate(5);

        return response()->json($data);
        
    }
    public function getList()
    {
        $data = Appointment::with("workingHous")->select("*", DB::raw("DATE_FORMAT(date,'%d.%m.%Y') as tarih"))->where("date", ">", date("Y-m-d"))->orderBy('date', "asc")->paginate(5);
    }
    public function getToDayList()
    {
        $data = Appointment::with("workingHous")->select("*", DB::raw("DATE_FORMAT(date,'%d.%m.%Y') as tarih"))->where("date", "=", date("Y-m-d"))->orderBy('created_at', "desc")->paginate(5);
        return response()->json($data);
    }

    public function getLastDayList()
    {
        $data = Appointment::with("workingHous")->select("*", DB::raw("DATE_FORMAT(date,'%d.%m.%Y') as tarih"))->where("date", "<", date("Y-m-d"))->orderBy('created_at', "desc")->paginate(5);
        return response()->json($data);
    }
    
    public function getWaitingList()
    {
        $data = Appointment::with("workingHous")->select("*", DB::raw("DATE_FORMAT(date,'%d.%m.%Y') as tarih"))->where("isStatu",0)->orderBy('created_at', "desc")->paginate(5);
        return response()->json($data);
    }
    

}
