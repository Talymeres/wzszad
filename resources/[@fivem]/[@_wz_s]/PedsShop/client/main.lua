ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.InitBossESX, function(obj) ESX = obj end)
        Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()

end)


local Style = {
    Line = { 0, 0, 255, 70 }
}
local newsStyle = Style


isMenuOpen = false
local F1MainMenu = RageUI.CreateMenu("", "~g~WZ",0, 0, 'banner', 'interaction_bgd')
F1MainMenu.Closed = function()
    isMenuOpen = false
    -- ESX.TriggerServerCallback("zF5:server:getGroup", function(group) 
    --     PlayerGroup = group
    --     if PlayerGroup ~= "user"then 
    --         CanOpenAdmin = true
    --     end
    -- end)
end
-- Divers
local F1WeaponMenu = RageUI.CreateSubMenu(F1MainMenu, "", "Menu Divers",0, 0, 'banner', 'interaction_bgd')

function OpenNewsF5Menu()
    if isMenuOpen then
        isMenuOpen = false
        RageUI.Visible(F1MainMenu, false)
    else 
        isMenuOpen = true 
        OpenF5Menu = 1
        RageUI.Visible(F1MainMenu, true)
        CreateThread(function()

            ESX.TriggerServerCallback("zF5:server:getGroup", function(group) 
                PlayerGroup = group
                if PlayerGroup ~= "user" then 
                    CanOpenAdmin = true
                elseif PlayerGroup == "user" then
                    CanOpenAdmin = false
                end
            end)

            while isMenuOpen do
                Wait(interval)
                RageUI.IsVisible(F1MainMenu, function()
                    RageUI.Separator("~w~↓ ~g~W.Z - Market  ~w~↓")
                    -- RageUI.Button("~b~→→ ~s~Inventaire", "Inventaire", {RightLabel = "→→"}, true, {}, F5InvetoryMenu)
                    -- RageUI.Button("~b~→→ ~s~Portefeuille", "Portefeuille", {RightLabel = "→→"}, true, {}, F5WalletMenu)
                    if Config.Emplacement.Factures == "Main" then
                        RageUI.Button("~b~→→ ~s~Factures", "Factures", {RightLabel = "→→"}, true, {
                            onSelected = function()
                                
                            end
                        }, F5BillingMenu)
                    end
                    
                    
                    
                    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == "boss" then
                        RageUI.Button("~b~→→ ~s~Gestion Entreprise", "Divers", {RightLabel = "→→"}, true, {}, F5EntrepriseMenu)
                     end
                    
                    if ESX.PlayerData.job2 ~= nil and ESX.PlayerData.job2.grade_name == "boss" then
                        RageUI.Button("~b~→→ ~s~Gestion Organisation", "Divers", {RightLabel = "→→"}, true, {}, F5GangsMenu)
                     end
                    
                     local ped = PlayerPedId()
                     local vehicle = GetVehiclePedIsUsing(ped)
 
                     local InVehicule = IsPedSittingInAnyVehicle(ped)
 
                     if InVehicule then 
                         RageUI.Button("~b~→→ ~s~Action Véhicule", "Divers", {RightLabel = "→→"}, true, {
                             onSelected = function()
                                 RageUI.CloseAll()
                                 isMenuOpen = false
 
                                 local vehicle = GetVehiclePedIsUsing(ped)
 
                                 local InVehicule = IsPedSittingInAnyVehicle(ped)
 
                                 if InVehicule then 
                                     OpenVehMainMenuInVehicule()
                                 end
                             end
                         })
 
                     end
                   
                    RageUI.Button("~b~→→ ~g~Weapon", "Take your weapons to fight you", {RightLabel = "→→"}, true, {}, F1WeaponMenu)                 
                end)
    



--------------------------------------------- WEAPON CHOOSE ---------------------------------------------



                RageUI.IsVisible(F1WeaponMenu, function()

                    RageUI.Separator("~g~Weapons")
                    RageUI.Button("~b~→→ ~s~M60", "", {RightLabel = "→→"}, true, {
                        onSelected = function()
                                GiveWeaponToPed(PlayerPedId(), 'WEAPON_combatmg', 9999, false, true)
                                GetWeaponComponentAccuracyModifier(0xD6C59CD6)
                                ESX.ShowAdvancedNotification('~g~WZ MARKET', '~w~Weapon', 'Weapon ~g~GIVE', 'CHAR_TREVOR', 3)
                                end
                    }) 

                    RageUI.Button("~b~→→ ~s~Carabine Spécial", "", {RightLabel = "→→"}, true, {
                        onSelected = function()
                                GiveWeaponToPed(PlayerPedId(), 'WEAPON_specialcarbine', 9999, false, true)
                                ESX.ShowAdvancedNotification('~g~WZ MARKET', '~w~Weapon', 'Weapon ~g~GIVE', 'CHAR_TREVOR', 3)
                                end
                    }) 

            end)

--------------------------------------------- WEAPON CHOOSE --------------------------------------------- 
                

                RageUI.IsVisible(IgnoreMOI, function() 

                end)
            end
        end)
    end
end

------------ SPAWN PED ----------------
Citizen.CreateThread(function()
    local hash = GetHashKey("ig_sol")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
      Wait(100)
    end
    ped = CreatePed("PED_TYPE_CIVMALE", "ig_sol", 190.4, -925.5, 29.70, 142.30, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_y_hiker_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
      Wait(100)
    end
    ped = CreatePed("PED_TYPE_CIVMALE", "a_m_y_hiker_01", 182.84, -929.21, 29.70, 327.32, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_m_prolhost_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
      Wait(100)
    end
    ped = CreatePed("PED_TYPE_CIVMALE", "a_m_m_prolhost_01", 209.27, -924.64, 29.70, 139.72, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_m_prolhost_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
      Wait(100)
    end
    ped = CreatePed("PED_TYPE_CIVMALE", "a_m_m_prolhost_01", 203.6, -944.88, 29.70, 23.92, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_y_soucent_02")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
      Wait(100)
    end
    ped = CreatePed("PED_TYPE_CIVMALE", "a_m_y_soucent_02", 184.88, -940.44, 29.10, 246.85, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
end)

------------ SPAWN PED ----------------

Citizen.CreateThread(function()
    while true do
        local interval = 1
        local pos = GetEntityCoords(PlayerPedId())
        local dest = vector3(190.4, -925.5, 29.70)
        local distance = GetDistanceBetweenCoords(pos, dest, true)


    if distance> 2.0 then
        interval = 1
    else
        interval = 1
        DrawMarker(false, true, 5, false, false, false, false)
            if IsControlPressed(1, 51) then
                OpenNewsF5Menu()
        end
    end
     Citizen.Wait(interval)
    end
end)