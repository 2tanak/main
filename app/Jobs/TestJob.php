<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;

class TestJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;
    private $data;

    public function __construct($data)
    {
        echo 111111111111111111111111111;

        $message=555555555555555555444444444444444;
        Log::debug($message); // logger()->debug($message);
        $this->data = $data;
    }

    public function handle()
    {

        #Log::emergency(this->data);
        echo file_put_contents(public_path('test.php'), $this->data);
        echo $this->data;
    }
}
