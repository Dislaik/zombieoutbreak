LoadModuleTranslations("Data/Locales/".. GlobalConfig.Lang ..".lua")
local Config = LoadModuleConfig("Data/Config.lua")
local WeaponEquipped = false

Inventory.Drop = {}
Inventory.DropId = 0
Inventory.VisualDrop = {}
Inventory.Loot = {}

Inventory.Open = false
Inventory.UpdateDrop = false
Inventory.CurrentWeapon = nil

SetInterval(0, function()
    if (IsControlJustReleased(0, 289)) and not Player.Dead() then
        AnimpostfxPlay("SwitchHUDIn", 0, true)
        SetNuiFocus(true, true)
        SendNUIMessage({
            Type = "Inventory",
            Display = true,
            Inventory = Inventory.PlayerItems,
            MaxWeight = GlobalConfig.PlayerWeight
        })
        
        Inventory.Open = true
    end
end)


Inventory.PlayerWeapon = function(Name, Ammo)
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

SetInterval(0, function()

    if IsPedArmed(PlayerPedId(), 6) then
        DisableControlAction(1, 140, true)
        DisableControlAction(1, 141, true)
        DisableControlAction(1, 142, true)
    end

    BlockWeaponWheelThisFrame()
    DisableControlAction(0, 37, true)

    if IsPedShooting(PlayerPedId()) then
        TriggerServerEvent("Inventory:UpdateWeaponAmmo", Inventory.CurrentWeapon)
    end

end)

Inventory.CreateObject = function(X, Y, Z, Heading)
    local Object = CreateObject(GetHashKey("PROP_BIG_BAG_01"), X, Y, Z, false, false, true)
    print(Object)
    SetEntityHeading(Object, Heading)
    SetEntityCollision(Object, false, false)
    PlaceObjectOnGroundProperly_2(Object)
    table.insert(Inventory.VisualDrop, Object)
end

Inventory.CreateDrop = function(Name, Item)
    local PlayerCoords = GetEntityCoords(PlayerPedId(), true)
    local PlayerHeading = GetEntityHeading(PlayerPedId())
    local Object = CreateObject(GetHashKey("PROP_BIG_BAG_01"), PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, false, false, true)
    table.insert(Inventory.VisualDrop, Object)
    SetEntityHeading(Object, PlayerHeading)
    SetEntityCollision(Object, false, false)
    PlaceObjectOnGroundProperly_2(Object)

    Item.Coords = GetEntityCoords(Object, false)
    Item.Heading = GetEntityHeading(Object)
    Item.Name = Name
    Item.Id = Inventory.DropId

    local Found = false
    for i in pairs(Inventory.Drop) do
        local Distance = Vdist(Item.Coords.x, Item.Coords.y, Item.Coords.z, Inventory.Drop[i].Coords.x, Inventory.Drop[i].Coords.y, Inventory.Drop[i].Coords.z)

        if Distance < 1.2 then
            for i in pairs(Inventory.VisualDrop) do
                if Inventory.VisualDrop[i] == Object then
                    table.remove(Inventory.VisualDrop, i)
                end
            end
            DeleteEntity(Object)
            Item.Coords = Inventory.Drop[i].Coords

            if Inventory.Drop[i].Name == Name and (Inventory.Drop[i].Type == "Item" or Inventory.Drop[i].Type == "Clothes") then
                Inventory.Drop[i].Count = Inventory.Drop[i].Count + Item.Count
                Found = true
                break
            end
        end
    end
    if not Found then
        Inventory.Drop[Inventory.DropId] = Item
        Inventory.DropId = Inventory.DropId + 1
    end
    Inventory.UpdateDrop = true
    TriggerServerEvent("Inventory:UpdateDrop", Inventory.Drop, Inventory.DropId)
end

RegisterNetEvent("Inventory:UpdateDrop")
AddEventHandler("Inventory:UpdateDrop", function(Drop, Id)
    Inventory.Drop = Drop
    Inventory.DropId = Id
end)

SetInterval(0, function()

    Inventory.DropGroup = {}
    local PlayerCoords = GetEntityCoords(PlayerPedId(), true)

    for i in pairs(Inventory.Drop) do
        local Distance = Vdist(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, Inventory.Drop[i].Coords.x, Inventory.Drop[i].Coords.y, Inventory.Drop[i].Coords.z)


        if (Config.Debug) then
            Utils.DrawText3D("Name: ".. Inventory.Drop[i].Name, Inventory.Drop[i].Coords.x, Inventory.Drop[i].Coords.y, Inventory.Drop[i].Coords.z, 0.5)
            DrawMarker(1, Inventory.Drop[i].Coords.x, Inventory.Drop[i].Coords.y, Inventory.Drop[i].Coords.z + 0.2, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 255, 255, 255, false, true, 2, nil, nil, false)
        end

        if Distance < 1.2 then
            table.insert(Inventory.DropGroup, Inventory.Drop[i])


            if (IsControlJustPressed(0, 289)) and not IsPedInAnyVehicle(PlayerPedId(), true) and not Player.Dead() then
                Inventory.UpdateDrop = true
            end
        end

    end

    if Inventory.UpdateDrop then

        RequestAnimDict("amb@medic@standing@kneel@base")
        while not HasAnimDictLoaded("amb@medic@standing@kneel@base") do
            Wait(0)
        end

        TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base", "base", 5.0, 10.0, -1, 1, 0, false, false, false)

        SendNUIMessage({
            Type = "UpdateDrop",
            Display = true,
            Inventory = Inventory.DropGroup
        })

        for i in pairs(Inventory.VisualDrop) do
            local ObjectCoords = GetEntityCoords(Inventory.VisualDrop[i])
            local Found = false
            for j in pairs(Inventory.Drop) do
                local Distance = Vdist(ObjectCoords.x, ObjectCoords.y, ObjectCoords.z, Inventory.Drop[j].Coords.x, Inventory.Drop[j].Coords.y, Inventory.Drop[j].Coords.z)
                if Distance < 0.6 then
                    Found = true
                    break
                end
            end
            if not Found then
                DeleteEntity(Inventory.VisualDrop[i])
                table.remove(Inventory.VisualDrop, i)
                SendNUIMessage({
                    Type = "UpdateDrop",
                    Display = false,
                    Inventory = Inventory.DropGroup
                })
            end
        end

        Inventory.UpdateDrop = false
    end
end)

Inventory.UseClothes = function(Item, Sex)

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