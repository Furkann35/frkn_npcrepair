fx_version "adamant"

game "gta5"

version "1.0.0"

server_scripts {
   '@es_extended/locale.lua',
   'config.lua',
   'server/main.lua', 
   '@mysql-async/lib/MySQL.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'config.lua',
    'client/main.lua'
}