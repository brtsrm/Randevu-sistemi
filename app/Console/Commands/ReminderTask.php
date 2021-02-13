<?php

namespace App\Console\Commands;

use App\Models\Appointment;
use App\Models\WorkingHours;
use Illuminate\Console\Command;
use Illuminate\Routing\Route;
use Illuminate\Support\Facades\Mail;

class ReminderTask extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'Reminder:Start';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $date = date("Y-m-d");
        $nextDate = date("Y-m-d", strtotime("+1 Day", time()));
        
        $list = Appointment::whereIn("date", [$date, $nextDate])
            ->where("isStatu", 1)
            ->get();
        foreach ($list as $k => $v) {

            $data = [
                "name" => $v["fullName"],
                "email" => $v["email"],
                "date" => $v["date"],
                'time' => WorkingHours::getString($v["workingHour"])
            ];
            try {

                Mail::send('email', $data, function ($message) use ($data) {
                    $message->to($data["email"], $data["name"])
                        ->subject("Randevu Hatırlatma");
                    $message->from("cemarsllan@gmail.com", "Laravel eğitim");
                });
                Appointment::where("id", $v["id"])->update(["isSend" => 1]);
            } catch (\Exception $e) {
                Route::redirect("/");
            }
        }
    }
}
