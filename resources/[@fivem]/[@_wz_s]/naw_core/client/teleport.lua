function Teleport(entity, position, heading, fade)
    local entity = entity or PlayerPedId()
    if transition == nil then 
        transition = true 
    end
    heading = heading or GetEntityHeading(entity)
    heading = heading + 0.0

    RequestCollisionAtCoord(position.x, position.y, position.z)  
    NewLoadSceneStart(position.x, position.y, position.z, position.x, position.y, position.z, 50.0, 0)

    local MaxTime = GetGameTimer()
    while not IsNewLoadSceneLoaded() do
        if GetGameTimer() - MaxTime > 3000 then
            break
        end
        Citizen.Wait(0)
    end
    local MaxTime2 = GetGameTimer()
    while not HasCollisionLoadedAroundEntity(entity) do
        if GetGameTimer() - MaxTime2 > 3000 then
            break
        end
        Citizen.Wait(0)
    end  

    if fade then
        DoScreenFadeOut(1000)
        Citizen.Wait(1000)
        SetEntityCoordsNoOffset(entity, position.x, position.y, position.z)
        SetEntityHeading(entity, heading)
        NewLoadSceneStop()
        Citizen.Wait(1000)
        DoScreenFadeIn(1000)
        return true
    else
        SetEntityCoordsNoOffset(entity, position.x, position.y, position.z)
        SetEntityHeading(entity, heading)
        NewLoadSceneStop()
        return true
    end
end

function GetNearzones(position, all)
    local lastCoord = vector3(0, 0, 0)
    local lastDist = 10000
    local zones = nil
    for k,v in pairs(RZ.zones.Pos) do 
        if all then 
            local dist = Vdist(position, v.pos)
            if dist < lastDist then 
                lastDist = dist
                zones = v
            end
        else
            if v.sprite then 
                local dist = Vdist(position, v.pos)
                if dist < lastDist then 
                    lastDist = dist
                    zones = v
                end
            end
        end
    end
    return zones
end

function IsInZoneSafeRadius(position, zones, radius)
    local dist = Vdist(position, zones.pos)
    if dist <= radius then 
        return true 
    else
        return false
    end
end