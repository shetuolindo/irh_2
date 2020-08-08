<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProfileView extends Model
{
    public $guarded = [];

    protected $table = 'profile_view';

    public $timestamps = false;

    public static function getProfileViewed($user_id)
    {
    	try {
    		$val = self::where('user_id',$user_id)->first()->profile_view;
    		return $val;
    	} catch (\Exception $e) {
    		return '0';
    	}
    }
}
