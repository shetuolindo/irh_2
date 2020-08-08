<?php

namespace App\Mail;

use App\User;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;
use DB;

class UserActivationMail extends Mailable
{
    use Queueable, SerializesModels;

    public $user;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(User $user)
    {
        $this->user = $user;
    }


    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $mailFooter = DB::table('mail_settings')->where('name', '=', 'footer')->first();
        return $this->from("info@projexin.com", "Activate Account")
                    ->subject("Activate your IRH account")
                    ->view('emails.activatinMail', ['user' => $this->user, 'mail_footer' => $mailFooter]);
    }
}
