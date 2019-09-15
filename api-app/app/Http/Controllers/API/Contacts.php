<?php

namespace App\Http\Controllers\API;

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
        $card = new Card;
        $card->first_name = $request->first_name;
        $card->last_name = $request->last_name;

        $card->save();

        if ($request->contacts) {
            foreach ($request->contacts as $contact) {
                $this->createNewContact($card, $contact);
            }
        }

        return 1;
    }

    public function updateCard(Request $request)
    {
        $card = Card::find($request['id']);

        if (isset($card)) {
            $card->first_name = $request['first_name'];
            $card->last_name = $request['last_name'];
            $card->save();

            if ($request->contacts) {
                foreach ($request->contacts as $new_contact) {

                    if (isset($new_contact['id']) && Contact::find($new_contact['id'])) {

                        $contact = Contact::find($new_contact['id']);

                        $contact->type = $new_contact['type'];
                        $contact->contact = $new_contact['contact'];
                        $contact->save();

                    } else {
                        $this->createNewContact($card, $new_contact);
                    }
                }
            }

            return 1;

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

        return $card->contacts()->save($new_contact);
    }


}
