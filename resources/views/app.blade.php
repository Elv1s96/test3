<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <title>{{ config('app.name') }}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <link href="{{ mix('css/app.css') }}" rel="stylesheet">
</head>
<body>
<v-app id="app">
    <header-component></header-component>
    <v-container>
        <v-row>
                <v-col>
                    @yield('content')
                </v-col>
        </v-row>
    </v-container>
</v-app>
<script src="{{ asset('js/app.js') }}" defer></script>
</body>
</html>
