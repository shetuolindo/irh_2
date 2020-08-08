<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Notice extends Model
{
    public $table = 'notices';
    
    public $guarded = [];
}
