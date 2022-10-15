--------------------------------------------------------------------------------------------------------------
------------First off, many thanks to @anders for help with the majority of this script. ---------------------
------------Also shout out to @setro for helping understand pNotify better.              ---------------------
--------------------------------------------------------------------------------------------------------------
------------To configure: Add/replace your own coords in the sectiong directly below.    ---------------------
------------        Goto LINE 90 and change "50" to your desired SafeZone Radius.        ---------------------
------------        Goto LINE 130 to edit the Marker( Holographic circle.)               ---------------------
--------------------------------------------------------------------------------------------------------------
-- Place your own coords here!
local zones = {
	{ ['x'] = 198.0, ['y'] = -930.0, ['z'] = 30.0} 
}

local notifIn = false
local notifOut = false
local closestZone = 1

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
-------                              Creating Blips at the locations. 							--------------
-------You can comment out this section if you dont want any blips showing the zones on the map.--------------
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	for i = 1, #zones, 1 do       
		local szBlip = 
		AddBlipForCoord(198.0, -930.0, 30.0)
		SetBlipAsShortRange(szBlip, true)
		SetBlipColour(szBlip, 6)  --Change the blip color: https://gtaforums.com/topic/864881-all-blip-color-ids-pictured/
		SetBlipSprite(szBlip, 557) -- Change the blip itself: https://marekkraus.sk/gtav/blips/list.html
		SetBlipCategory(szBlip, 2)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Secure Post Los Santos") -- What it will say when you hover over the blip on your map.
		EndTextCommandSetBlipName(szBlip)	

	end
end)

local coords = vector3(198.0, -930.0, 30.0)

local Radius = AddBlipForRadius(coords, 50.0) -- need to have .0
SetBlipColour(Radius, 2)
SetBlipAlpha(Radius, 128)


-----------------------------------------------------------------------------

---------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
----------------   Getting your distance from any one of the locations  --------------------------------------
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	while true do
		local playerPed = GetPlayerPed(-1)
		local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
		local minDistance = 100000
		for i = 1, #zones, 1 do
			dist = Vdist(zones[i].x, zones[i].y, zones[i].z, x, y, z)
			if dist < minDistance then
				minDistance = dist
				closestZone = i
			end
		end
		Citizen.Wait(15000)
	end
end)

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
---------   Setting of friendly fire on and off, disabling your weapons, and sending pNoty   -----------------
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------


Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	while true do
		Citizen.Wait(0)
		local player = GetPlayerPed(-1)
		local x,y,z = table.unpack(GetEntityCoords(player, true))
		local dist = Vdist(zones[closestZone].x, zones[closestZone].y, zones[closestZone].z, x, y, z)
	
		if dist <= 50.0 then  ------------------------------------------------------------------------------ Here you can change the RADIUS of the Safe Zone. Remember, whatever you put here will DOUBLE because 
			if not notifIn then																			  -- it is a sphere. So 50 will actually result in a diameter of 100. I assume it is meters. No clue to be honest.
				Citizen.CreateThread( function()
					while true do
						Citizen.Wait(0)
						RestorePlayerStamina(PlayerId(), 1.0)
						SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
						SetPlayerInvincible(PlayerId(), true)
						SetPedRagdollOnCollision(PlayerId(), true)
					  end
				end)	
				SetCanAttackFriendly(GetPlayerPed(-1), true, false)
				NetworkSetFriendlyFireOption(true)
				ClearPlayerWantedLevel(PlayerId())
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),false)
				TriggerEvent("pNotify:SendNotification",{
					text = "<b style='color:#1E90FF'>You enter in a SafeZone</b>",
					type = "success",
					timeout = (3000),
					layout = "bottomcenter",
					queue = "global",
					Citizen.Trace('-----------------------------------------------------------------------\nENTER SAFEZONE [ PROTECT ]\n')
				})
				TriggerEvent("pNotify:SendNotification",{
					text = "<b style='color:#1E90FF'>INVINCIBLE : ACTIVED</b>",
					type = "success",
					timeout = (1000),
					layout = "bottomleft",
					queue = "global",
					Citizen.Trace('-----------------------------------------------------------------------\nINVINCIBLE : ACTIVED\n')
				})
				TriggerEvent("pNotify:SendNotification",{
					text = "<b style='color:#1E90FF'>SPEED : ACTIVED</b>",
					type = "success",
					timeout = (1000),
					layout = "bottomleft",
					queue = "global",
					Citizen.Trace('-----------------------------------------------------------------------\nSPEED : ACTIVED\n')
				})	
				notifIn = true
				notifOut = false
			end
		else
			if not notifOut then
				Citizen.CreateThread( function()
					while true do
						Citizen.Wait(0)
						RestorePlayerStamina(PlayerId(), 1.0)
						SetRunSprintMultiplierForPlayer(PlayerId(), 1.00)
						SetPlayerInvincible(PlayerId(), false)
					  end
				end)	
				NetworkSetFriendlyFireOption(true)
				TriggerEvent("pNotify:SendNotification",{
					text = "<b style='color:#1E90FF'>you left the SafeZone</b>",
					type = "error",
					timeout = (3000),
					layout = "bottomcenter",
					queue = "global",
					Citizen.Trace('-----------------------------------------------------------------------\nLEFT SAFEZONE [ UNPROTECT ]\n')
				})
				TriggerEvent("pNotify:SendNotification",{
					text = "<b style='color:#1E90FF'>INVINCIBLE : DESACTIVED</b>",
					type = "success",
					timeout = (1000),
					layout = "bottomleft",
					queue = "global",
					Citizen.Trace('-----------------------------------------------------------------------\nINVINCIBLE : DESACTIVED\n')
				})	
				TriggerEvent("pNotify:SendNotification",{
					text = "<b style='color:#1E90FF'>SPEED : DESACTIVED</b>",
					type = "success",
					timeout = (1000),
					layout = "bottomleft",
					queue = "global",
					Citizen.Trace('-----------------------------------------------------------------------\nSPEED : DESACTIVED\n')
				})	
				notifOut = true
				notifIn = false
			end
		end
		

		-- if notifIn then
		-- DisableControlAction(2, 37, false) -- disable weapon wheel (Tab)
		-- DisablePlayerFiring(player,false) -- Disables firing all together if they somehow bypass inzone Mouse Disable
      	-- DisableControlAction(0, 106, true) -- Disable in-game mouse controls
		-- 	if IsDisabledControlJustPressed(2, 37) then --if Tab is pressed, send error message
		-- 		SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),false) -- if tab is pressed it will set them to unarmed (this is to cover the vehicle glitch until I sort that all out)
		-- 		TriggerEvent("pNotify:SendNotification",{
		-- 			text = "<b style='color:#1E90FF'>You can not use weapons in a Safe Zone</b>",
		-- 			type = "error",
		-- 			timeout = (3000),
		-- 			layout = "bottomcenter",
		-- 			queue = "global",
		-- 			Citizen.Trace('-----------------------------------------------------------------------\nNO WEAPON [ DESACTIVED ]\n')
		-- 		})
			-- end

			-- if IsDisabledControlJustPressed(0, 106) then --if Tab is pressed, send error message
			-- 	TriggerEvent("pNotify:SendNotification",{
			-- 		text = "<b style='color:#1E90FF'>you can't put damage in the Safe Zone</b>",
			-- 		type = "error",
			-- 		timeout = (3000),
			-- 		layout = "bottomright",
			-- 		queue = "global",
			-- 		Citizen.Trace('-----------------------------------------------------------------------\nNO DOMAGE\n')
			-- 	})
			-- end			
			-- if IsDisabledControlJustPressed(0, 106) then --if LeftClick is pressed, send error message
			-- 	SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),false) -- If they click it will set them to unarmed
			-- 	TriggerEvent("pNotify:SendNotification",{
			-- 		text = "<b style='color:#1E90FF'>You can not do that in a Safe Zone</b>",
			-- 		type = "error",
			-- 		timeout = (3000),
			-- 		layout = "bottomcenter",
			-- 		queue = "global"
			-- 	})
			-- end
		-- end
		-- Comment out lines 142 - 145 if you dont want a marker.
	 	if DoesEntityExist(player) then	      --The -1.0001 will place it on the ground flush		-- SIZING CIRCLE |  x    y    z | R   G    B   alpha| *more alpha more transparent*
	 		-- DrawMarker(1, zones[closestZone].x, zones[closestZone].y, zones[closestZone].z-1.0001, 0, 0, 0, 0, 0, 0, 100.0, 100.0, 2.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0) -- heres what all these numbers are. Honestly you dont really need to mess with any other than what isnt 0.
	 		--DrawMarker(type, float posX, float posY, float posZ, float dirX, float dirY, float dirZ, float rotX, float rotY, float rotZ, float scaleX, float scaleY, float scaleZ, int red, int green, int blue, int alpha, BOOL bobUpAndDown, BOOL faceCamera, int p19(LEAVE AS 2), BOOL rotate, char* textureDict, char* textureName, BOOL drawOnEnts)
	 	end
	end
end)