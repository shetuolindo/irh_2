<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Option extends Model
{
    public $guarded = [];

    public static function getOption($name)
    {
    	try {
    		$val = self::where('name',$name)->first()->value;
    		return $val;
    	} catch (\Exception $e) {
    		return null;
    	}
    }
}
