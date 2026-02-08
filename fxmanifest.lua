fx_version 'cerulean'
game {'gta5'}
lua54 'yes'

author 'vezironi'
description 'Simple, easy, and useful FiveM legal jobs'

scriptname 'no1-legaljobs'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config/*.lua',
    'shared/*.lua',
}

client_scripts {
    'client/*.lua',
    'modules/**/**/client.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'modules/**/**/server.lua',
    'server/*.lua',
}

escrow_ignore {
    'config/*.lua',
}

dependencies {
    'ox_lib',
}