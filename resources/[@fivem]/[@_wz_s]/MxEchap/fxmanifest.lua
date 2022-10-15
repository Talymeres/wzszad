fx_version 'bodacious'

author 'HRM#8912'
description 'Pause Menu'

ui_page 'html/ui.html'
game 'gta5'

client_script {
    'client/*.lua'
}

escrow_ignore {
    'config.lua',
    'html/config.js',
    'html/app.css',
    'html/ui.html'
}

lua54 'yes'

shared_script 'config.lua'

files {
	'html/**',
    'html/sounds/**'
}