fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'Script Template for RedM QR-Core | xThrasherrr#6666'
author 'xThrasherrr#6666'

shared_scripts { '@ox_lib/init.lua', 'modules/shared.lua', 'shared/*.lua' }
client_scripts { 'modules/client.lua', 'client/*.lua' }
server_scripts { 'server/*.lua' }
files { 'locales/*.json' }

lua54 'yes'