<?php

namespace App\Http\Controllers\API;

use Exception;
use App\Models\Card;
use App\Models\Contact;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class Contacts extends Controller
{
    public function list()
    {
        return Card::with('contacts')->get();
    }

    public function create(Request $request)
    {
        $new_card = $request->card;
        $card = new Card;
        $card->first_name = $new_card['first_name'];
        $card->last_name = $new_card['last_name'];

        $card->save();

        $contacts = [];

        if ($new_card['contacts']) {
            foreach ($new_card['contacts'] as $contact) {
                $contact = $this->createNewContact($card, $contact);
                array_push($contacts, $contact);
            }
        }

        if (isset($card['contacts'])) {
            $card['contacts'] = $contacts;
        }

        return $card;
    }

    public function updateCard(Request $request)
    {
        $new_card = $request->card;

        $card = Card::find($new_card['id']);

        if (isset($card)) {
            $card->first_name = $new_card['first_name'];
            $card->last_name = $new_card['last_name'];
            $card->save();

            $contacts = [];

            if ($new_card['contacts']) {

                foreach ($new_card['contacts'] as $new_contact) {

                    if (isset($new_contact['id']) && Contact::find($new_contact['id'])) {

                        $contact = Contact::find($new_contact['id']);
                        $contact->type = $new_contact['type'];
                        $contact->contact = $new_contact['contact'];
                        $contact->save();

                        array_push($contacts, $contact);

                    } else {
                        $contact = $this->createNewContact($card, $new_contact);
                        array_push($contacts, $contact);
                    }
                }
            }

            if (isset($card['contacts'])) {
                $card['contacts'] = $contacts;
            }

            return $card;

        } else {
            return 'cards with id: ' . $request['id'] . ' not found';
        }
    }

    public function deleteCard(Request $request)
    {
        return Card::destroy($request->id);
    }


    public function deleteContact(Request $request)
    {
        return Contact::destroy($request->id);
    }


    public function createNewContact($card, $contact)
    {
        $new_contact = new Contact;
        $new_contact->type = $contact['type'];
        $new_contact->contact = $contact['contact'];

        $card->contacts()->save($new_contact);
        return $new_contact;
    }


}
