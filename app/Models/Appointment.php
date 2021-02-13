<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Appointment extends Model
{
    use HasFactory;
    protected $guarded = [];
    protected $tablo = "appointments";
    public function workingHous(){
       return $this->belongsTo(WorkingHours::class,"workingHour");
    }

}
