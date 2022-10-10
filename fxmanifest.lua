fx_version 'bodacious'
game 'gta5'

author 'Kallock - The Goodlife RP Server'
version '1.0.0'

dependencies {
    "PolyZone"
}

client_script {
    'client.lua',
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',

}

server_script {
	'server.lua',
}

shared_script 'shared.lua'
