<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ResourceTag extends Model
{
    public $table = 'resource_tag';
    
    public $guarded = [];
    public $timestamps = false;
}
