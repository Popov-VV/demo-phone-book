<?php

Route::post('/api/contact/list', 'API\Contacts@list');
Route::post('/api/contact/create', 'API\Contacts@create');
Route::post('/api/contact/update-card', 'API\Contacts@updateCard');
Route::post('/api/contact/delete-card', 'API\Contacts@deleteCard');
Route::post('/api/contact/delete-contact', 'API\Contacts@deleteContact');

