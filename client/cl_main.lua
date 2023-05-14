local Player = QRCore.Functions.GetPlayerData()
local CurrentLocation = nil
local Peds = {}
local Blips = {}

-- Setup --
local function SetupFastTravel()
    for x,t in pairs(Config.Locations) do
        local Ped = Config.Locations[x].Ped
        if Peds[x] == nil then
            Peds[x] = XTSpawnPed(Ped.model, Ped.coords)

            exports['qr-target']:AddTargetEntity(Peds[x], {
                options = {
                    {
                        action = function()
                            TriggerEvent("xtr-telegrams:client:FastTravelMenu", x)
                        end,
                        icon = 'fas fa-map',
                        label = locale('targetTitle'),
                    }
                },
                distance = 4,
            })
        end
        local Blip = Config.Locations[x].Blip
        if Blip.enable and Blips[x] == nil then
            Blips[x] = XTBlip(Blip.name, vector3(Ped.coords.x, Ped.coords.y, Ped.coords.z), Blip.sprite, Blip.size)
        end
    end
end

-- Cleanup --
local function CleanupFastTravel()
    for x,_ in pairs(Config.Locations) do
        if Peds[x] ~= nil then DeletePed(Peds[x]) Peds[x] = nil end
        if Blips[x] ~= nil then RemoveBlip(Blips[x]) Blips[x] = nil end
    end
end

-- Fast Travel Menu --
RegisterNetEvent('xtr-telegrams:client:FastTravelMenu', function(CURRENT)
    CurrentLocation = CURRENT
    local Locations = {}

    for x,t in pairs(Config.Locations) do
        if x ~= CURRENT then
            Locations[#Locations+1] = {
                title = x,
                metadata = { locale('price')..t.price },
                event = 'xtr-fasttravel:client:AttemptTravel',
                args = { target = x, current = CURRENT }
            }
        end
    end

    lib.registerContext({
        id = 'fasttravel_menu',
        title = locale('fastTravelTitle')..CURRENT,
        options = Locations
    })
    lib.showContext('fasttravel_menu')
end)

-- Choose Payment & Attempt Travel --
RegisterNetEvent('xtr-fasttravel:client:AttemptTravel', function(DATA)
    if DATA.target ~= CurrentLocation then
        local Payment = lib.inputDialog(locale('paymentTypeTitle'), {
            { type = 'select', label = locale(paymentType), options = {
                { value = 'cash', label = locale('cash')..Config.Locations[DATA.target].price },
                { value = 'bank', label = locale('gold')..Config.Locations[DATA.target].price }
            }},
        })
        if Payment == 'cancel' then return end
        TriggerServerEvent('xtr-fasttravel:server:Travel', Payment[1], DATA.target, DATA.current)
    end
end)

-- Fast Travelling --
RegisterNetEvent('xtr-fasttravel:client:FastTravel', function(LOC)
    local coords = Config.Locations[LOC].spawnCoords
    DoScreenFadeOut(2000)
    while not IsScreenFadedOut() do Wait(0) end
    Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, locale('travelText1'), LOC, locale('travelText2'))

    Wait(Config.WaitLength * 1000)
    FreezeEntityPosition(cache.ped, true)
    SetEntityCoords(cache.ped, coords)
    SetEntityHeading(coords.h)
    Citizen.InvokeNative(0x9587913B9E772D29, cache.ped, 0)
    FreezeEntityPosition(cache.ped, false)

    while GetIsLoadingScreenActive() do Wait(100) ShutdownLoadingScreen() end
    Wait(1500)
    DoScreenFadeIn(2000)
    XTDebug('Fast Travel', 'Location: '..LOC)
end)

-- Player Load --
local function playerLoaded()
    Player = QRCore.Functions.GetPlayerData()
    SetupFastTravel()
end

-- Player Unload --
local function playerUnload()
    Player = {}
    CleanupFastTravel()
end

AddEventHandler('onResourceStart', function(resource) if resource == GetCurrentResourceName() then playerLoaded() end end)
AddEventHandler('onResourceStop', function(resource) if resource == GetCurrentResourceName() then playerUnload() end end)
RegisterNetEvent('QRCore:Client:OnPlayerLoaded', function() playerLoaded() end)
RegisterNetEvent('QRCore:Client:OnPlayerUnload', function() playerUnload() end)