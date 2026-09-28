fx_version 'cerulean'
game 'gta5'

description 'OxLibRedesignSystem'
version '1.0.0'

author 'EnderDevelopment'

dependency 'es_extended'

dependency 'ox_lib'

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

shared_scripts {
    'config.lua',
    'shared.lua'
}

files {
    'database.sql'
}