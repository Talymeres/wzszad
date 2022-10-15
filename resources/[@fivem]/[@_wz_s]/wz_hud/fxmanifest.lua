fx_version 'adamant'
games { 'gta5' };

name 'rz-hud'
description ''

contributor {
    'kaykL',
    'TayZ'
};

ui_page 'html/ui.html'

files {
    'html/ui.html',
    'html/script.js',
    'html/main.css',
    '/html/img/*.webp',
    '/html/img/*.png',
}

client_scripts {
    'hud_client.lua'
}