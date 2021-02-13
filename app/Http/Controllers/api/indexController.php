<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Appointment;
use App\Models\WorkingHours;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\App;

class indexController extends Controller
{

    public function getWorkingHours($date = null)
    {
        $date = ($date == null) ? date("Y-m-d") : $date;
        $day = date("l",strtotime($date));
        $returnArray = [];
        $hours = WorkingHours::where("day", $day)->get();
        foreach ($hours as $hoursKey => $hoursVal) {

            $control = Appointment::where('date', $date)->where('workingHour', $hoursVal["id"])
            ->where(function($control){
                $control->orWhere("isStatu",1);
                $control->orWhere("isStatu",0);
            })
            ->count();
            $hoursVal["isStatu"] = ($control == 0) ? true : false;
            $returnArray[] = $hoursVal;

        }

        return response()->json($returnArray);
    }

    public function process(Request $request)
    {

        $all = $request->except("_token");
        Appointment::where("id", $all["id"])->update(["isStatu" => $all["type"]]);
        return response()->json(["status" => true]);

    }

    public function appointmentStore(Request $request)
    {
        $returnArray = [];
        $returnArray["status"] = false;
        $all = $request->except('_token');
        $control = Appointment::where('date', $all["date"])->where('workingHour', $all["workingHour"])->count();
        if ($control != 0) {
            $returnArray["message"] = "Bu randevu tarihi doludur";
            return response()->json($returnArray);
        }
        $create = Appointment::create($all);
        if ($create) {
            $returnArray["status"] = true;
            $returnArray["message"] = "Randevunuz Oluşturuldu.";
        } else {
            $returnArray["message"] = "Veri Eklenemedi";
        }

        return response()->json($returnArray);
    }

    public function getWorkingStore(Request $request)
    {
        $all = $request->except('_token');
        WorkingHours::query()->delete();
        foreach ($all as $k => $v) {
            foreach ($v as $key => $value) {
                WorkingHours::create([
                    "day" => $k,
                    "hours" => $value,
                ]);
            }
        }

        $success = Arr::collapse($all, ["status" => "success"]);
        return response()->json($success);
    }

    public function getWorkingList()
    {
        $returnArray = [];
        $data = WorkingHours::all();
        foreach ($data as $k => $v) {
            $returnArray[$v["day"]][] = $v["hours"];
        }
        return response()->json($returnArray);
    }

}
