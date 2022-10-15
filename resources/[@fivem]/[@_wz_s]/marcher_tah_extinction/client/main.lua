canInteract = true


Citizen.CreateThread(function()
    -- Initialisation du blip
    local blip = AddBlipForCoord(Config.position.x, Config.position.y, Config.position.z)
    SetBlipSprite(blip, 478)
    SetBlipColour(blip, 28)
    SetBlipScale(blip, 0.7)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("Market")
    EndTextCommandSetBlipName(blip)
    -- Initialisation de la zone d'interaction
    while true do
        local interval = 250
        local playerPos = GetEntityCoords(PlayerPedId())
        local zone = Config.position
        local distance = #(playerPos - zone)
        if distance <= Config.drawDist then
            interval = 0
            DrawMarker(22, zone.x, zone.y, zone.z, false, true, 2, false, false, false, false)
            if distance <= 1.0 then
                if canInteract then
                    AddTextEntry("WZ Market", "Appuyez sur ~INPUT_CONTEXT~ pour accéder à \"~y~WZ Market~s~\"")
                    DisplayHelpTextThisFrame("LBC", 0)
                    if IsControlJustPressed(0, 51) then
                        canInteract = false
                        TriggerServerEvent("esx_leboncoin:interact")
                    end
                end
            end
        end
        Wait(interval)
    end
end)
