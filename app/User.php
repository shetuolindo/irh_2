<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Auth;
use App\Role;
use App\Notifications\PasswordReset;
use App\Events\ForgotPasswordEvent;

class User extends Authenticatable
{
    use Notifiable;
    //use HasRoles;
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    public $guarded = [];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /*===========================================
    =            Controller Handlers            =
    ===========================================*/
    
    
    
    /*=====  End of Controller Handlers  ======*/
    

    /*=====================================
    =            Relationships            =
    =====================================*/


    public function sendPasswordResetNotification($token)
    {
        //$this->notify(new PasswordReset($token));
        event(new ForgotPasswordEvent(['email' => $this->email, 'token' => $token]));
    }
    
    public function resources()
    {
        return $this->hasMany(Resource::class);
    }

    public function flags()
    {
        return $this->hasMany(ResourceFlag::class);
    }

    public function likes()
    {
        return $this->hasMany(ResourceLike::class);
    }

    public function reviews()
    {
        return $this->hasMany(ResourceReview::class);
    }

    public function my_messages()
    {
        return $this->hasMany(Message::class,'user_from');
    }

    public function their_messages()
    {
        return $this->hasMany(Message::class,'user_to');
    }
    
    /*=====  End of Relationships  ======*/

    /*=================================
    =            Accessors            =
    =================================*/
    
    /*public function getUserRoleAttribute()
    {
        $role = $this->getRoleNames()->first();
        if($role)
        {
            return $role;
        }
        else
        {
            return 'N/A';
        }
        
    }*/

    public function roles(){
        return $this->belongsToMany(Role::class);
    }

    public function getFullNameAttribute()
    {
        return $this->first_name.' '.$this->last_name;
    }

    public function getProfilePicturePathAttribute()
    {
        if($this->profile_picture !== null)
        {
            return '/irh_assets/uploads/profile_pictures/'.$this->profile_picture;
        }
        else
        {
            return '/irh_assets/images/dummyuser.png';
        }
    }
    
    /*=====  End of Accessors  ======*/
    
    /*===========================
    =            Helpers            =
    ===========================*/
    
    public function isPrivate($key)
    {
        $private = $this->private_info;
        $arr = explode(',',$private);
        if(in_array($key, $arr))
        {
            return true;
        }
        return false;
    }
    

    public function getUnreadUserMessagesCount()
    {
        $messages = Message::where('user_to',$this->id)->where('user_from','<>',$this->id)->where('unread',1)->count();
        if($messages)
        {
            return $messages;
        }
        return 0;
    }

    /*=====  End of Helpers  ======*/


    public static function getFullName($id)
    {
        try {
            $val = self::where('id',$id)->first();
            return $val->first_name.' '.$val->last_name;
        } catch (\Exception $e) {
            return null;
        }
    }
    
    public static function isUserExist($email)
    {
        try {
            $val = self::where('email',$email)->first();
            return $val->id;
        } catch (\Exception $e) {
            return '0';
        }
    }


    public static function getUserName($id)
    {
        try {
            $val = self::where('id',$id)->first();
            return $val->username;
        } catch (\Exception $e) {
            return null;
        }
    }
}
