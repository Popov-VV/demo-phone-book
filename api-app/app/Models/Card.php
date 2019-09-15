<?php

namespace App\Models;

use App\Models\Contact;
use Illuminate\Database\Eloquent\Model;

class Card extends Model
{
    public function contacts()
    {
        return $this->hasMany(Contact::class);
    }

}
