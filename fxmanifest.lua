fx_version 'cerulean'
game 'gta5'

author 'Your Name'
description 'Advanced Pause Menu with ESX/QBCore Support'
version '1.0.0'

shared_scripts {
    'themes.lua',
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

dependencies {
    'oxmysql'
}

lua54 'yes'

