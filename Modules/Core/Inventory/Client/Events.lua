RegisterNUICallback("Inventory:Use", function(Data)
    if Data.Item.Type == "Item" then
        TriggerServerEvent("Inventory:UseItem", Data.Item.Name)
    elseif Data.Item.Type == "Weapon" then
        Inventory.CurrentWeapon = Data.Item.Name
        Inventory.PlayerWeapon(Data.Item.Name, Data.Item.Ammo)
    elseif Data.Item.Type == "Clothes" then
        Inventory.UseClothes(Data.Item, Skin.GetPlayerSex())
    end
end)

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
            Inventory.CreateDrop(Data.Name, Data.Item)

            if Data.Type == "Clothes" then
                TriggerEvent("Skin:RemoveClothes", Data.Name, Skin.GetPlayerSex())
            end

        elseif Data.Type == "Weapon" then
            TriggerServerEvent("Inventory:RemoveWeapon", Data.Name)
            RemoveWeaponFromPed(PlayerPedId(), GetHashKey(Data.Name))
            Inventory.CreateDrop(Data.Name, Data.Item)
        end

        SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
    end
end)

RegisterNUICallback("Inventory:Close", function(Data)
    SetNuiFocus(false, false)
    SendNUIMessage({
        Type = "Inventory",
        Display = false
    })
    ClearPedTasks(PlayerPedId())
    AnimpostfxStop("SwitchHUDIn")
    Inventory.Open = false
end)

RegisterNUICallback("Inventory:Lootable", function(Data)
    for i in pairs(Inventory.Drop) do
        local Drop = Inventory.Drop[i]
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
    for i in pairs(Inventory.Drop) do
        if Inventory.Drop[i].Id == Id then
            if Inventory.Drop[i].Type == "Item" or Inventory.Drop[i].Type == "Clothes" then
                if Inventory.Drop[i].Count > 1 then
                    Inventory.Drop[i].Count = Inventory.Drop[i].Count - 1
                else
                    Inventory.Drop[i] = nil
                end
            elseif Inventory.Drop[i].Type == "Weapon" then
                Inventory.Drop[i] = nil
            end
            break
        end
    end

    TriggerServerEvent("Inventory:UpdateDrop", Inventory.Drop, Inventory.DropId)

    Inventory.UpdateDrop = true
end)


RegisterNetEvent("Inventory:PlayerInventory")
AddEventHandler("Inventory:PlayerInventory", function(Data)
    Inventory.PlayerItems = Data
end)

RegisterNetEvent("Inventory:UpdatePlayerInventory")
AddEventHandler("Inventory:UpdatePlayerInventory", function(Data)
    Inventory.PlayerItems = Data
    if Inventory.Open then
        SendNUIMessage({
            Type = "UpdateInventory",
            Inventory = Inventory.PlayerItems,
            MaxWeight = GlobalConfig.PlayerWeight
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
        table.insert(Inventory.VisualDrop, Object)
    end
end)

RegisterNetEvent("Inventory:Loot")
AddEventHandler("Inventory:Loot", function(Ped, Loot)
    Inventory.Loot[Ped] = Loot
end)

RegisterNetEvent("Inventory:RemoveLoot")
AddEventHandler("Inventory:RemoveLoot", function(Ped, Item)
    for i in pairs(Inventory.Loot[Ped]) do
        if Item.Name == i then
            if Inventory.Loot[Ped][i].Type == "Item" or Inventory.Loot[Ped][i].Type == "Clothes" then
                if Inventory.Loot[Ped][i].Count > 1 then
                    Inventory.Loot[Ped][i].Count = Inventory.Loot[Ped][i].Count - 1
                else
                    Inventory.Loot[Ped][i] = nil
                end
            elseif Inventory.Loot[Ped][i].Type == "Weapon" then
                Inventory.Loot[Ped][i] = nil
            end
            break
        end
    end

    TriggerEvent("Inventory:Loot", Inventory.Loot[Ped])

    if next(Inventory.Loot[Ped]) == nil then
        DecorSetBool(Ped, "ZombieLoot", false)
        SendNUIMessage({
            Type = "UpdateLoot",
            Display = false,
            Ped = Ped,
            Inventory = Inventory.Loot[Ped]
        })
    else
        SendNUIMessage({
            Type = "UpdateLoot",
            Display = true,
            Ped = Ped,
            Inventory = Inventory.Loot[Ped]
        })
    end
end)