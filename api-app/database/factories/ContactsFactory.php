<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Card;
use App\Models\Contact;
use Faker\Generator as Faker;

$factory->define(Contact::class, function (Faker $faker) {
    return [
        'card_id' => factory(Card::class)->create()->id,
        'type' => 'phone',
        'contact' => $faker->phoneNumber,
    ];
});
