ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
end)

RegisterNetEvent('droz:kevlar3')
AddEventHandler('droz:kevlar3', function()

    local playerPed = PlayerPedId()

    AddArmourToPed(playerPed,100)
    SetPedArmour(playerPed, 100)

end)
    