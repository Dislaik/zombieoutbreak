local Utils = M("Utils")
--[[
RegisterNUICallback("Inventory:Use", function(Data)
    if Data.Item.Type == "Item" then
        TriggerServerEvent("Inventory:UseItem", Data.Item.Name)
    elseif Data.Item.Type == "Weapon" then
        Module.CurrentWeapon = Data.Item.Name
        Module.PlayerWeapon(Data.Item.Name, Data.Item.Ammo)
    elseif Data.Item.Type == "Clothes" then
        Module.UseClothes(Data.Item, Skin.GetPlayerSex())
    end
end)
--]]

RegisterNUICallback("Inventory:Use", function(data)
    --[[for _, i in pairs(data.item) do
        print(_, i)
    end--]]
    ---print("item used:", data.item.Name)


    TriggerServerEvent("Inventory:UseItem", data.item)

    --[[if data.item.Type == "Normal" then

        TriggerServerEvent("Inventory:ItemNormal", data.item)

    elseif data.item.Type == "Food" then

        TriggerServerEvent("Inventory:ItemFood", data.item)

    end--]]

end)


--[[

RegisterNUICallback("Inventory:Give", function(Data)
    local PlayerCoords = GetEntityCoords(PlayerPedId(), true)
    for i, _Player in pairs(GetActivePlayers()) do
        local PlayerId = GetPlayerFromServerId(_Player)
        local PlayerTargetCoods = GetEntityCoords(GetPlayerPed(PlayerId), true)
        local Distance = Vdist(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, PlayerTargetCoods.x, PlayerTargetCoods.y, PlayerTargetCoods.z)

        if PlayerId ~= -1 and Distance < 1.5 then
            if Data.Input > 0 then
                TriggerServerEvent("Inventory:Give", PlayerId, Data.Item, Data.Input)
            end
        else
            Player.ShowNotification(Translate("Inventory:No_Player_Nearby"))
        end
    end

end)

RegisterNUICallback("Inventory:Throw", function(Data)
    if Data.Input > 0 then
        
        RequestAnimDict("amb@medic@standing@kneel@base")
        while not HasAnimDictLoaded("amb@medic@standing@kneel@base") do
            Wait(0)
        end

        TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base", "base", 5.0, 10.0, -1, 49, 0, false, false, false)

        if Data.Type == "Item" or Data.Type == "Clothes" then
            if Data.Input > Data.Item.Count then
                --Data.Item.Input = Data.Item.Count
            else
                Data.Item.Count = Data.Input
            end
           
            
            TriggerServerEvent("Inventory:RemoveItem", Data.Name, Data.Input)
            Module.CreateDrop(Data.Name, Data.Item)

            if Data.Type == "Clothes" then
                TriggerEvent("Skin:RemoveClothes", Data.Name, Skin.GetPlayerSex())
            end

        elseif Data.Type == "Weapon" then
            TriggerServerEvent("Inventory:RemoveWeapon", Data.Name)
            RemoveWeaponFromPed(PlayerPedId(), GetHashKey(Data.Name))
            Module.CreateDrop(Data.Name, Data.Item)
        end

        SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
    end
end)
--]]

RegisterNUICallback("Inventory:Close", function(Data)
    SetNuiFocus(false, false)
    SendNUIMessage({
        Type = "Inventory",
        Display = false
    })
    ClearPedTasks(PlayerPedId())
    AnimpostfxStop("SwitchHUDIn")
    SetFrontendActive(false)
    --Module.Open = false
end)
--[[
RegisterNUICallback("Inventory:Lootable", function(Data)
    for i in pairs(Module.Drop) do
        local Drop = Module.Drop[i]
        if Data.Id == Drop.Id then
            TriggerServerEvent("Inventory:Lootable", Drop)
        end
    end
end)

RegisterNUICallback("Inventory:Loot", function(Data)
    TriggerServerEvent("Inventory:CheckLoot", Data.PedHandler, Data.Item)
end)

RegisterNetEvent("Inventory:RemoveLootable")
AddEventHandler("Inventory:RemoveLootable", function(Id)
    for i in pairs(Module.Drop) do
        if Module.Drop[i].Id == Id then
            if Module.Drop[i].Type == "Item" or Module.Drop[i].Type == "Clothes" then
                if Module.Drop[i].Count > 1 then
                    Module.Drop[i].Count = Module.Drop[i].Count - 1
                else
                    Module.Drop[i] = nil
                end
            elseif Module.Drop[i].Type == "Weapon" then
                Module.Drop[i] = nil
            end
            break
        end
    end

    TriggerServerEvent("Inventory:UpdateDrop", Module.Drop, Module.DropId)

    Module.UpdateDrop = true
end)

--]]
RegisterEvent("Inventory:PlayerInventory", function(data)
    Module.PlayerItems = Module.redefinePlayerItems(data)
end)
--[[
RegisterNetEvent("Inventory:UpdatePlayerInventory")
AddEventHandler("Inventory:UpdatePlayerInventory", function(Data)
    Module.PlayerItems = Data
    if Module.Open then
        SendNUIMessage({
            Type = "UpdateInventory",
            Inventory = Module.PlayerItems,
            MaxWeight = 32.0
        })
    end
end)

RegisterNetEvent("Inventory:CreateDrop")
AddEventHandler("Inventory:CreateDrop", function(Drop)
    for i in pairs(Drop) do
       local Object = CreateObject(GetHashKey("PROP_BIG_BAG_01"), Drop[i].Coords.x, Drop[i].Coords.y, Drop[i].Coords.z, false, false, true)
        SetEntityHeading(Object, Drop[i].Heading)
        SetEntityCollision(Object, false, false)
        PlaceObjectOnGroundProperly_2(Object)
        table.insert(Module.VisualDrop, Object)
    end
end)

RegisterNetEvent("Inventory:Loot")
AddEventHandler("Inventory:Loot", function(Ped, Loot)
    Module.Loot[Ped] = Loot
end)

RegisterNetEvent("Inventory:RemoveLoot")
AddEventHandler("Inventory:RemoveLoot", function(Ped, Item)
    for i in pairs(Module.Loot[Ped]) do
        if Item.Name == i then
            if Module.Loot[Ped][i].Type == "Item" or Module.Loot[Ped][i].Type == "Clothes" then
                if Module.Loot[Ped][i].Count > 1 then
                    Module.Loot[Ped][i].Count = Module.Loot[Ped][i].Count - 1
                else
                    Module.Loot[Ped][i] = nil
                end
            elseif Module.Loot[Ped][i].Type == "Weapon" then
                Module.Loot[Ped][i] = nil
            end
            break
        end
    end

    TriggerEvent("Inventory:Loot", Module.Loot[Ped])

    if next(Module.Loot[Ped]) == nil then
        DecorSetBool(Ped, "ZombieLoot", false)
        SendNUIMessage({
            Type = "UpdateLoot",
            Display = false,
            Ped = Ped,
            Inventory = Module.Loot[Ped]
        })
    else
        SendNUIMessage({
            Type = "UpdateLoot",
            Display = true,
            Ped = Ped,
            Inventory = Module.Loot[Ped]
        })
    end
end)
--]]