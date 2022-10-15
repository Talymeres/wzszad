RZ = RZ or {}

RegisterServerEvent("rz-killfeed:server:killfeed")
AddEventHandler("rz-killfeed:server:killfeed", function(killed, killer, weapon, logorank, logorank2)
    TriggerClientEvent('rz-killfeed:client:kill', killed, killer, weapon, logorank, logorank2)
end)