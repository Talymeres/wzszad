ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)

        if IsControlJustPressed(0, Config.OpenKey) then
            SetPauseMenuActive(false)
            StartScreenEffect(blur, 1, true)
           heading = GetEntityHeading(PlayerPedId())

           ReplaceHudColourWithRgba(117, 0, 0, 0, 0)
       
           ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_EMPTY_NO_BACKGROUND"), true, -1)
       
           Citizen.Wait(100)
       
           N_0x98215325a695e78a(false)
       
           PlayerPedPreview = ClonePed(PlayerPedId(), heading, true, false)
       
           local x,y,z = table.unpack(GetEntityCoords(PlayerPedPreview))
       
           SetEntityCoords(PlayerPedPreview, x,y,z-10)
       
           FreezeEntityPosition(PlayerPedPreview, true)
       
           SetEntityVisible(PlayerPedPreview, false, false)
       
           NetworkSetEntityInvisibleToNetwork(PlayerPedPreview, false)
       
           Wait(200)
       
           SetPedAsNoLongerNeeded(PlayerPedPreview)
       
           GivePedToPauseMenu(PlayerPedPreview, 2)
       
           SetPauseMenuPedLighting(true)
       
           SetPauseMenuPedSleepState(true)	
           SetTimecycleModifier('hud_def_blur') -- blur
           SendNUIMessage({Notify = true, text = "[ " ..GetPlayerName(PlayerId()).. " ]  - Votre ID : [ "..GetPlayerServerId(PlayerId()).." ]"})
           SetNuiFocus(true, true)
           SendNUIMessage({
              respawn = true,
              action = "respawn"
          })
        end
    end
end)

RegisterNUICallback('exit', function()
    SendNUIMessage({
		showsk = false,
		action = "show"
	})
	SetNuiFocus(false, false)
    SetTimecycleModifier('default') -- blur
    SetNuiFocus(false, false)

    SetFrontendActive(false)

    ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_EMPTY_NO_BACKGROUND"), false, -1)

    Citizen.Wait(100)

    N_0x98215325a695e78a(false)

    FreezeEntityPosition(PlayerPedPreview, false)

    NetworkSetEntityInvisibleToNetwork(PlayerPedPreview, true)

    Wait(200)

    SetPedAsNoLongerNeeded(PlayerPedPreview)

    SetPauseMenuPedLighting(false)

    SetPauseMenuPedSleepState(false)
end)

RegisterCommand('exit', function()
    SendNUIMessage({
		showsk = false,
		action = "show"
	})
	SetNuiFocus(false, false)
    SetTimecycleModifier('default') -- blur
    SetNuiFocus(false, false)

    SetFrontendActive(false)

    ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_EMPTY_NO_BACKGROUND"), false, -1)

    Citizen.Wait(100)

    N_0x98215325a695e78a(false)

    FreezeEntityPosition(PlayerPedPreview, false)

    NetworkSetEntityInvisibleToNetwork(PlayerPedPreview, true)

    Wait(200)

    SetPedAsNoLongerNeeded(PlayerPedPreview)

    SetPauseMenuPedLighting(false)

    SetPauseMenuPedSleepState(false)
end)

RegisterNUICallback('map', function()
    SendNUIMessage({
		showsk = false,
		action = "show"
	})
	SetNuiFocus(false, false)
    SetTimecycleModifier('default') -- blur
    SetNuiFocus(false, false)

    SetFrontendActive(false)

    ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_EMPTY_NO_BACKGROUND"), false, -1)

    Citizen.Wait(100)

    N_0x98215325a695e78a(false)

    FreezeEntityPosition(PlayerPedPreview, false)

    NetworkSetEntityInvisibleToNetwork(PlayerPedPreview, true)

    Wait(200)

    SetPedAsNoLongerNeeded(PlayerPedPreview)

    SetPauseMenuPedLighting(false)

    SetPauseMenuPedSleepState(false)
    SetFrontendActive(true)
    ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_MP_PAUSE"), true, -1)
    Wait(500)
    SetControlNormal(0, 18, 1.0)
end)

RegisterNUICallback('settings', function()
    SendNUIMessage({
		showsk = false,
		action = "show"
	})
	SetNuiFocus(false, false)
    SetTimecycleModifier('default') -- blur
    SetNuiFocus(false, false)

    SetFrontendActive(false)

    ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_EMPTY_NO_BACKGROUND"), false, 1)

    Citizen.Wait(100)

    N_0x98215325a695e78a(false)

    FreezeEntityPosition(PlayerPedPreview, false)

    NetworkSetEntityInvisibleToNetwork(PlayerPedPreview, true)

    Wait(200)

    SetPedAsNoLongerNeeded(PlayerPedPreview)

    SetPauseMenuPedLighting(false)

    SetPauseMenuPedSleepState(false)
    SetFrontendActive(true)
    ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_LANDING_MENU"), true, -1)
end)

RegisterNUICallback('leave', function()
    SendNUIMessage({
		showsk = false,
		action = "show"
	})
	SetNuiFocus(false, false)
    SetTimecycleModifier('default') -- blur
    SetNuiFocus(false, false)

    SetFrontendActive(false)

    ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_EMPTY_NO_BACKGROUND"), false, -1)

    Citizen.Wait(100)

    N_0x98215325a695e78a(false)

    FreezeEntityPosition(PlayerPedPreview, false)

    NetworkSetEntityInvisibleToNetwork(PlayerPedPreview, true)

    Wait(200)

    SetPedAsNoLongerNeeded(PlayerPedPreview)

    SetPauseMenuPedLighting(false)

    SetPauseMenuPedSleepState(false)
    Wait(10)
    ForceSocialClubUpdate()
end)