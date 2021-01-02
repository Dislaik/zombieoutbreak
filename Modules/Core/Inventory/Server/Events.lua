LoadModuleTranslations("Data/Locales/".. GlobalConfig.Lang ..".lua")

RegisterNetEvent("Inventory:UseItem")
AddEventHandler("Inventory:UseItem", function(Item)
    local _Player = Player(source)

    if UsableItems[Item] then
        UsableItems[Item](_Player.Source)
    end

end)

RegisterNetEvent("Inventory:UpdateWeaponAmmo")
AddEventHandler("Inventory:UpdateWeaponAmmo", function(WeaponAmmo)
    local _Player = Player(source)
    _Player.RemoveWeaponAmmo(WeaponAmmo, 1)
end)

RegisterNetEvent("Inventory:RemoveItem")
AddEventHandler("Inventory:RemoveItem", function(Item, Count)
    local _Player = Player(source)
    _Player.RemoveItem(Item, Count)
end)

RegisterNetEvent("Inventory:RemoveWeapon")
AddEventHandler("Inventory:RemoveWeapon", function(WeaponName)
    local _Player = Player(source)
    _Player.RemoveWeapon(WeaponName)
end)

RegisterNetEvent("Inventory:Lootable")
AddEventHandler("Inventory:Lootable", function(Item)
    local _Player = Player(source)
    if _Player.CurrentWeight() <= GlobalConfig.PlayerWeight then
        if Item.Type == "Item" or Item.Type == "Clothes" then
            if _Player.CanCarryItem(Item.Name, 1) then
                _Player.AddItem(Item.Name, 1)
                TriggerClientEvent("Inventory:RemoveLootable", _Player.Source, Item.Id)
            else
                _Player.ShowNotification(Translate("Inventory:Cant_Carry_Item"))
            end
        elseif Item.Type == "Weapon" then
            if not _Player.HasWeapon(Item.Name) then
                _Player.AddWeapon(Item.Name, Item.Ammo, Item.Components, Item.Tint)
                TriggerClientEvent("Inventory:RemoveLootable", _Player.Source, Item.Id)
            else
                _Player.ShowNotification(Translate("Inventory:Cant_Carry_Weapon"))
            end
        end
    else
        _Player.ShowNotification(Translate("Inventory:Encumbered"))
    end
end)

RegisterNetEvent("Inventory:Give")
AddEventHandler("Inventory:Give", function(PlayerTarget, Item, Input)
    local _Player = Player(source)
    local _Target = Player(PlayerTarget)
    if _Target.CurrentWeight() <= GlobalConfig.PlayerWeight then
        if Item.Type == "Item" or Item.Type == "Clothes" then

            if _Target.CanCarryItem(Item.Name, Input) then
                _Target.AddItem(Item.Name, Input)
                _Player.RemoveItem(Item.Name, Input)

                if Item.Type == "Clothes" then
                    TriggerClientEvent("Skin:RemoveClothes", _Player.Source, Item.Name)
                end

                if Input > 1 then
                    _Player.ShowNotification(Translate("Inventory:Player_Give_Item", Item.Label, Input, _Target.GetName()))
                    _Target.ShowNotification(Translate("Inventory:Target_Give_Item", Item.Label, Input, _Player.GetName()))
                else
                    _Player.ShowNotification(Translate("Inventory:Player_Give_OneItem", Item.Label, _Target.GetName()))
                    _Target.ShowNotification(Translate("Inventory:Target_Give_OneItem", Item.Label, _Player.GetName()))
                end

            else
                _Player.ShowNotification(Translate("Inventory:Player_Give_CantTakeMore", Item.Label, _Target.GetName()))
                _Target.ShowNotification(Translate("Inventory:Target_Give_CantTakeMore", _Player.GetName(), Item.Label))
            end
        elseif Item.Type == "Weapon" then
            if not _Target.HasWeapon(Item.Name) then
                _Target.AddWeapon(Item.Name, Item.Ammo, Item.Components, Item.Tint)
                _Player.RemoveWeapon(Item.Name)

                _Player.ShowNotification(Translate("Inventory:Player_Give_Weapon", Item.Label, _Target.GetName()))
                _Target.ShowNotification(Translate("Inventory:Target_Give_Weapon", Item.Label, _Player.GetName()))

            else
                _Player.ShowNotification(Translate("Inventory:Player_Give_HasWeapon", Item.Label, _Target.GetName()))
                _Target.ShowNotification(Translate("Inventory:Target_Give_HasWeapon", _Player.GetName(), Item.Label))
            end
        end
    else
        _Player.ShowNotification(Translate("Inventory:Player_Give_Encumbered", Item.Label, _Target.GetName()))
        _Target.ShowNotification(Translate("Inventory:Target_Give_Encumbered", _Player.GetName(), Item.Label))
    end
end)


RegisterNetEvent("Inventory:UpdateDrop")
AddEventHandler("Inventory:UpdateDrop", function(Drop, Id)
    Inventory.Drop = Drop
    Inventory.DropId = Id
end)

RegisterNetEvent("Inventory:CheckLoot")
AddEventHandler("Inventory:CheckLoot", function(Ped, Item)
    local _Player = Player(source)
    if Item.Type == "Item" or Item.Type == "Clothes" then
        if _Player.CanCarryItem(Item.Name, 1) then
            _Player.AddItem(Item.Name, 1)
            TriggerClientEvent("Inventory:RemoveLoot", _Player.Source, Ped, Item)
        else
            _Player.ShowNotification(Translate("Inventory:Cant_Carry_Item"))
        end
    elseif Item.Type == "Weapon" then
        if not _Player.HasWeapon(Item.Name) then
            _Player.AddWeapon(Item.Name, Item.Ammo)
            TriggerClientEvent("Inventory:RemoveLoot", _Player.Source, Ped, Item)
        else
            _Player.ShowNotification(Translate("Inventory:Cant_Carry_Weapon"))
        end
    end
end)