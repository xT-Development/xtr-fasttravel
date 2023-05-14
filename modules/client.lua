-- Ped Relationships --
function GetDefaultRelationshipGroupHash(iParam0)
    return Citizen.InvokeNative(0x3CC4A718C258BDD0 , iParam0);
end

function SetPedRelationshipGroupHash(iVar0, iParam0)
    return Citizen.InvokeNative(0xC80A74AC829DDD92, iVar0, GetDefaultRelationshipGroupHash(iParam0))
end


-- Create Blip --
function XTBlip(text, coords, icon, scale)
    if text == nil then XTDebug('Create Blip Error', 'Missing Blip Text!') return end
    if coords == nil then XTDebug('Create Blip Error', 'Missing Blip Coordinates!') return end
    if icon == nil then XTDebug('Create Blip Error', 'Missing Blip Icon!') return end
    if scale == nil then XTDebug('Create Blip Error', 'Missing Blip Scale!') return end

    local NewBlip = N_0x554d9d53f696d002(1664425300, coords)
    SetBlipSprite(NewBlip, icon, 1)
    SetBlipScale(NewBlip, scale)
    Citizen.InvokeNative(0x9CB1A1623062F402, NewBlip, text)
    XTDebug('Create Blip', 'Blip Text: '..text..' | Coords: '..coords)
    return NewBlip
end

-- Spawn Ped --
function XTSpawnPed(model, coords)
    if model == nil then XTDebug('Spawn Ped Error', 'Missing Model Hash!') return end
    if coords == nil then XTDebug('Spawn Ped Error', 'Missing Spawn Coordinates!') return end

    local pedmodel = GetHashKey(model)

    while not HasModelLoaded(GetHashKey(model)) do Wait(500) RequestModel(GetHashKey(model)) end

    local NewPed = CreatePed(pedmodel, coords.x, coords.y, coords.z - 1, coords.w, false, false, 0, 0)
    while not DoesEntityExist(NewPed) do Wait(300) end

    Citizen.InvokeNative(0x283978A15512B2FE, NewPed, true)
    FreezeEntityPosition(NewPed, true)
    SetEntityInvincible(NewPed, true)
    TaskStandStill(NewPed, -1)
    SetBlockingOfNonTemporaryEvents(NewPed, true)
    SetPedRelationshipGroupHash(NewPed, pedmodel)
    SetEntityCanBeDamagedByRelationshipGroup(NewPed, false, `PLAYER`)
    SetEntityAsMissionEntity(NewPed, true, true)
    SetModelAsNoLongerNeeded(pedmodel)
    XTDebug('Spawn Ped', 'Ped Name: '..NewPed..' Model: '..pedmodel..' Coordinates: '..coords)
    return NewPed
end