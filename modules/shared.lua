-- Shared Modules --
QRCore = exports['qr-core']:GetCoreObject()

-- Debug Print --
function XTDebug(type, debugTxt)
    if debugTxt == nil then debugTxt = '' end
    if Config.Debug then print("^0xT Debug ^7| "..type.." | ^0"..debugTxt) end
end

-- Debug / Resource Print on Startup --
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        XTDebug('dsc.gg/xtdev', '^7 | '..resource)
    end
end)
