Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        SendNUIMessage({
            pauseMenu = IsPauseMenuActive(),
            armour = GetPedArmour(PlayerPedId()),
            health = GetEntityHealth(PlayerPedId())-100,
        })
    end
end)