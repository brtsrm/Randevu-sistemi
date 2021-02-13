<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WorkingHours extends Model
{
    use HasFactory;
    protected $table = "working_hours";
    protected $guarded = [];
    static function getString($workingHourId){
        $controler = WorkingHours::where('id',$workingHourId)->count();
        if($controler != 0) {
            $w = WorkingHours::where('id',$workingHourId)->get();
            return $w[0]["hour"];
        }
    }
}
