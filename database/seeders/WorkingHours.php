<?php

namespace Database\Seeders;

use App\Models\WorkingHours as ModelsWorkingHours;
use Illuminate\Database\Seeder;

class WorkingHours extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        $newCreate = new ModelsWorkingHours;
        #$newCreate->hours = "15-16";
        // $newCreate->hours = "16-17";
        // $newCreate->hours = "17-18";
        $newCreate->save();

    }
}
