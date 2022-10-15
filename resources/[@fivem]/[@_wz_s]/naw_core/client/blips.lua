function CreateBlip(position, text, sprite, color, scale, shortRange, route, colorRoute, radius, radiuscolor, radiusopacity)
    if sprite then 
        local blip = AddBlipForCoord(position)
        local blip2 = nil

        if sprite then 
            SetBlipSprite(blip, sprite) 
        end
        if color then 
            SetBlipColour(blip, color) 
        end
        if scale then 
            SetBlipScale(blip, scale) 
        end
        if route then 
            SetBlipRoute(blip, route) 
        end
        if colorRoute then 
            SetBlipRouteColour(blip, colorRoute) 
        end
        SetBlipAsShortRange(blip, shortRange or true)
        if text then
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(text)
            EndTextCommandSetBlipName(blip)
        end
    end

    if radius then 
        blip2 = AddBlipForRadius(position, radius)
        SetBlipHighDetail(blip2, true)
        SetBlipColour(blip2, radiuscolor)
        SetBlipAlpha(blip2, radiusopacity)
    end
    
    return blip, blip2
end

function CreateBlip2(position, sprite, display, scale, color, shortRange)
    if sprite then
        local blip = AddBlipForCoord(position)
        if sprite then
            SetBlipSprite(blip, sprite)
        end
        if display then
            SetBlipDisplay(blip, display)
        end
        if scale then
            SetBlipScale(blip, scale)
        end
        if color then
            SetBlipColour(blip, color)
        end
        SetBlipAsShortRange(blip, shortRange or true)
    end
    return blip
end

function RemoveBlip(blip)
    if DoesBlipExist(blip) then
        RemoveBlip(blip)
    end
end
