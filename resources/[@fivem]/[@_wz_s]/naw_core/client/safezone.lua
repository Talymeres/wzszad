local notifIn = false
local notifOut = false
local closestZone = 1

local zones = {
	{pos = vector3(195.21, -933.91, 30.69), respawn = vector3(195.21, -933.91, 30.69), radius = 90.0, sprite = 557, opacity = 128, color = 69, scale = 1.4, inZone = false, name = 'Avant Poste Los Santos'}, -- Sandy Shores PD
}

Citizen.CreateThread(function()
    for k,v in pairs(zones) do 
		if v.sprite then 
        	CreateBlip(v.pos, v.name, v.sprite, v.color, v.scale, nil, nil, nil, v.radius, v.color, v.opacity)
		end
    end
end)

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	while true do
		local playerPed = GetPlayerPed(-1)
		local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
		local minDistance = 100000
		for k,v in pairs(zones) do 
			dist = Vdist(v.pos)
			if dist < minDistance then
				minDistance = dist
				closestZone = v
			end
		end
		Citizen.Wait(15000)
	end
end)

Citizen.CreateThread(function()
    local player = PlayerPedId()
    while true do

        -- Is the player dead or alive?
        local isPlayerDead = IsPlayerDead(player)

        --If dead, then...
        if isPlayerDead then
            -- And we are not showing the death screen...
            --  Then show the death screen
			print('hello')
        -- Else if the player is not dead.
        end
        Citizen.Wait(100)
    end
end)

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	while true do
		Citizen.Wait(0)
		local player = GetPlayerPed(-1)
		local x,y,z = table.unpack(GetEntityCoords(player, true))
		local dist = Vdist(closestZone.pos, x, y, z)
	
		if dist <= 50.0 then
			if not inZone then		
				--ADD NOTIF
				inZone = true
				notifOut = false
			end
		else
			if not notifOut then
				--ADD NOTIF
				SetRadarZoomPrecise(-1.0)
				notifOut = true
				inZone = false
			end
		end
		if inZone then
				NetworkSetFriendlyFireOption(false)
				SetCanAttackFriendly(player, false, false)
				SetPedCanRagdoll(player, false)
				SetPedMoveRateOverride(player, 2.0)

				for v in EnumerateVehicles() do
					local player = PlayerPedId()
					local pVeh = GetVehiclePedIsIn(player, false)
					if pVeh then 
						SetEntityNoCollisionEntity(pVeh, v, false)
						SetEntityNoCollisionEntity(v, pVeh, false)
						ResetEntityAlpha(pVeh)
					end
					SetEntityNoCollisionEntity(player, v, false)
					SetEntityNoCollisionEntity(v, player, false)
					if v ~= pVeh then 
						SetEntityAlpha(v, 150, 150)
					end
					
				end
				
				for _, v in pairs(GetActivePlayers()) do
					local otherPlayerPed = GetPlayerPed(v)
					if otherPlayerPed and otherPlayerPed ~= player then
						SetPedAoBlobRendering(otherPlayerPed, false)
						SetEntityAlpha(otherPlayerPed, 200, 0)
						SetEntityNoCollisionEntity(otherPlayerPed, player, true)
						ResetEntityAlpha(player)
					end
				end
			SetRadarZoomPrecise(70.0)
		end
	end
end)