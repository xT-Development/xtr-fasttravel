RegisterNetEvent('xtr-fasttravel:server:Travel', function(PAY, TARGET, CURRENT)
    local src = source
    local Player  = QRCore.Functions.GetPlayer(src)
    if not Player then return end
    local paymentAmount = Config.Locations[TARGET].price
    local pCoords = GetEntityCoords(GetPlayerPed(src))
    local locCoords = vector3(Config.Locations[CURRENT].Ped.coords.x, Config.Locations[CURRENT].Ped.coords.y, Config.Locations[CURRENT].Ped.coords.z)
    local dist = #(pCoords - locCoords)
    if dist > 5 then return end

    if Player.Functions.RemoveMoney(PAY, paymentAmount) then
        TriggerClientEvent('xtr-fasttravel:client:FastTravel', src, TARGET)
        XTDebug('Fast Travel Success', 'Location: '..TARGET)
    end
end)