
local Player = M("Player")
local Interact = M("Interact")
local mainNUIOpen = false
--[[
local WeaponEquipped = false

Module.Drop = {}
Module.DropId = 0
Module.VisualDrop = {}
Module.Loot = {}

Module.Open = false
Module.UpdateDrop = false
Module.CurrentWeapon = nil
--]]


RegisterCommand("test2", function(source, args, rawCommand)
    --print(Player:getPlayer():Loaded())
    print(Player.loaded())
end, false)

SetInterval(0, function(id)
    --print(Player:getPlayer():loaded())
    if Player:getPlayer():loaded() then
        SendNUIMessage({
            Type = "Inventory",
            Display = true,
            Name = "Matias Salas",
            Inventory = Module.PlayerItems
        })
        print("asd")
        ClearInterval(id)



    --[[if (IsControlJustReleased(0, 289)) and not Player.Dead() then
        --local playerCoords = GetEntityCoords(PlayerPedId())

        --AnimpostfxPlay("SwitchHUDIn", 0, true)
        
        SetCursorLocation(0.5, 0.5)
        SetNuiFocus(true, true)
        SendNUIMessage({
            Type = "Inventory",
            Display = true,
            Name = "Matias Salas"
            --Inventory = Module.PlayerItems
        })

        --[[SetFrontendActive(true)
        ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_EMPTY"), true, -1)

        Interval = SetInterval(10, function()
            N_0x98215325a695e78a(false)
        end)

        PlayerPedPreview = ClonePed(PlayerPedId(), GetEntityHeading(PlayerPedId()), false, false)
        SetEntityCoordsNoOffset(PlayerPedPreview, playerCoords.x, playerCoords.y, playerCoords.z - 50.0, false, false, false) -- Prevent tick display
        SetEntityVisible(PlayerPedPreview, false, true)

        FreezeEntityPosition(PlayerPedPreview, true)
        N_0x4668d80430d6c299(PlayerPedPreview)
        Wait(50)
        GivePedToPauseMenu(PlayerPedPreview, 2)

        SetPauseMenuPedLighting(true)
        SetPauseMenuPedSleepState(true)

        --Module.Open = true
        Wait(500)--]]
        --print(json.encode(Items))
    end
end)


SetInterval(0, function(id)

    if (IsControlJustReleased(0, 289)) and not Player:getPlayer():isDead() then
        if not mainNUIOpen then
            SetNuiFocus(true, true)
            SetNuiFocusKeepInput(true)
            SetCursorLocation(0.5, 0.5)
            mainNUIOpen = true
            --print(json.encode(Items))
            --print("Open")
        else
            --print("closed")
            SetNuiFocusKeepInput(false)
            SetNuiFocus(false, false)
            mainNUIOpen = false
        end
    end

    if mainNUIOpen then
        DisableControlAction(0, 1,   true) -- LookLeftRight
        DisableControlAction(0, 2,   true) -- LookUpDown
        DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
        DisableControlAction(0, 142, true) -- MeleeAttackAlternate
    end


end)

--[[

Module.PlayerWeapon = function(Name, Ammo)
    local LastWeaponEquipped

    if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey(Name) then
        WeaponEquipped = true
        LastWeaponEquipped = Name
    else
        WeaponEquipped = false
    end

    if not WeaponEquipped or LastWeaponEquipped ~= Name then
        RemoveAllPedWeapons(PlayerPedId(), false)
        SetPedAmmo(PlayerPedId(), GetHashKey(Name), 0)
        GiveWeaponToPed(PlayerPedId(), GetHashKey(Name), Ammo, true, true)
        WeaponEquipped = true
        LastWeaponEquipped = Name
    else
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
        WeaponEquipped = false
    end
end

Module.CreateObject = function(X, Y, Z, Heading)
    local Object = CreateObject(GetHashKey("PROP_BIG_BAG_01"), X, Y, Z, false, false, true)
    print(Object)
    SetEntityHeading(Object, Heading)
    SetEntityCollision(Object, false, false)
    PlaceObjectOnGroundProperly_2(Object)
    table.insert(Module.VisualDrop, Object)
end

Module.CreateDrop = function(Name, Item)
    local PlayerCoords = GetEntityCoords(PlayerPedId(), true)
    local PlayerHeading = GetEntityHeading(PlayerPedId())
    local Object = CreateObject(GetHashKey("PROP_BIG_BAG_01"), PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, false, false, true)
    table.insert(Module.VisualDrop, Object)
    SetEntityHeading(Object, PlayerHeading)
    SetEntityCollision(Object, false, false)
    PlaceObjectOnGroundProperly_2(Object)

    Item.Coords = GetEntityCoords(Object, false)
    Item.Heading = GetEntityHeading(Object)
    Item.Name = Name
    Item.Id = Module.DropId

    local Found = false
    for i in pairs(Module.Drop) do
        local Distance = Vdist(Item.Coords.x, Item.Coords.y, Item.Coords.z, Module.Drop[i].Coords.x, Module.Drop[i].Coords.y, Module.Drop[i].Coords.z)

        if Distance < 1.2 then
            for i in pairs(Module.VisualDrop) do
                if Module.VisualDrop[i] == Object then
                    table.remove(Module.VisualDrop, i)
                end
            end
            DeleteEntity(Object)
            Item.Coords = Module.Drop[i].Coords

            if Module.Drop[i].Name == Name and (Module.Drop[i].Type == "Item" or Module.Drop[i].Type == "Clothes") then
                Module.Drop[i].Count = Module.Drop[i].Count + Item.Count
                Found = true
                break
            end
        end
    end
    if not Found then
        Module.Drop[Module.DropId] = Item
        Module.DropId = Module.DropId + 1
    end
    Module.UpdateDrop = true
    TriggerServerEvent("Inventory:UpdateDrop", Module.Drop, Module.DropId)
end

RegisterNetEvent("Inventory:UpdateDrop")
AddEventHandler("Inventory:UpdateDrop", function(Drop, Id)
    Module.Drop = Drop
    Module.DropId = Id
end)

SetInterval(0, function()

    Module.DropGroup = {}
    local PlayerCoords = GetEntityCoords(PlayerPedId(), true)

    for i in pairs(Module.Drop) do
        local Distance = Vdist(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Module.Drop[i].Coords.x, Module.Drop[i].Coords.y, Module.Drop[i].Coords.z)


        if (Config.Debug) then
            Utils.DrawText3D("Name: ".. Module.Drop[i].Name, Module.Drop[i].Coords.x, Module.Drop[i].Coords.y, Module.Drop[i].Coords.z, 0.5)
            DrawMarker(1, Module.Drop[i].Coords.x, Module.Drop[i].Coords.y, Module.Drop[i].Coords.z + 0.2, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 255, 255, 255, false, true, 2, nil, nil, false)
        end

        if Distance < 1.2 then
            table.insert(Module.DropGroup, Module.Drop[i])


            if (IsControlJustPressed(0, 289)) and not IsPedInAnyVehicle(PlayerPedId(), true) and not Player.Dead() then
                Module.UpdateDrop = true
            end
        end

    end

    if Module.UpdateDrop then

        RequestAnimDict("amb@medic@standing@kneel@base")
        while not HasAnimDictLoaded("amb@medic@standing@kneel@base") do
            Wait(0)
        end

        TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base", "base", 5.0, 10.0, -1, 1, 0, false, false, false)

        SendNUIMessage({
            Type = "UpdateDrop",
            Display = true,
            Inventory = Module.DropGroup
        })

        for i in pairs(Module.VisualDrop) do
            local ObjectCoords = GetEntityCoords(Module.VisualDrop[i])
            local Found = false
            for j in pairs(Module.Drop) do
                local Distance = Vdist(ObjectCoords.x, ObjectCoords.y, ObjectCoords.z, Module.Drop[j].Coords.x, Module.Drop[j].Coords.y, Module.Drop[j].Coords.z)
                if Distance < 0.6 then
                    Found = true
                    break
                end
            end
            if not Found then
                DeleteEntity(Module.VisualDrop[i])
                table.remove(Module.VisualDrop, i)
                SendNUIMessage({
                    Type = "UpdateDrop",
                    Display = false,
                    Inventory = Module.DropGroup
                })
            end
        end

        Module.UpdateDrop = false
    end
end)

Module.UseClothes = function(Item, Sex)

    if Root.UsableClothes[Item.Name] then
        if Root.UsableClothes[Item.Name][Sex] then
            Root.UsableClothes[Item.Name][Sex]()
        else
            Player.ShowNotification(Translate("Inventory:Clothes_Not_Available_For_Player_Sex", Item.Label))
        end
    else
        Player.ShowNotification(Translate("Inventory:Clothes_Not_Available", Item.Label))
    end
end
--]]