local Config = LoadModuleConfig("Data/Config.lua")

RegisterNetEvent("Plague:LootCorpse")
AddEventHandler("Plague:LootCorpse", function(Ped, Loot, TotalProbability)
    local _Player = Player(source)
    local LootItems = {}

    for i = 1, Utils.Random(1, Config.MaxItemsLoot) do
        local CurrentProbability = 0
        local RandomLoot = Utils.Random(1, TotalProbability)
        local Item

        for i in pairs(Config.LootProbability) do
            CurrentProbability = CurrentProbability + Config.LootProbability[i]
            if RandomLoot <= CurrentProbability then
                if next(Loot[i]) ~= nil then
                    Item = Loot[i][Utils.Random(1, #Loot[i])]
                    break
                end
            end
        end

        for j in pairs(Inventory.Items) do
            if Inventory.Items[j].Name == Item then
                LootItems[Item] = {}
                LootItems[Item]["Type"] = "Item"
                LootItems[Item]["Name"] = Item
                LootItems[Item]["Count"] = Utils.Random(1, Config.MaxItemCount)
                LootItems[Item]["Label"] = Inventory.Items[j].Label
                LootItems[Item]["Description"] = Inventory.Items[j].Description
                LootItems[Item]["Weight"] = Inventory.Items[j].Weight
                LootItems[Item]["Limit"] = Inventory.Items[j].Limit
            end
        end

        for j in pairs(Inventory.Weapons) do
            if Inventory.Weapons[j].Name == Item then
                LootItems[Item] = {}
                LootItems[Item]["Type"] = "Weapon"
                LootItems[Item]["Name"] = Item
                LootItems[Item]["Label"] = Inventory.Weapons[j].Label
                LootItems[Item]["Description"] = Inventory.Weapons[j].Description
                LootItems[Item]["Weight"] = Inventory.Weapons[j].Weight
                LootItems[Item]["Ammo"] = Utils.Random(0, Config.MaxWeaponAmmo)
                LootItems[Item]["Components"] = nil
                LootItems[Item]["Tint"] = 0
            end
        end

        for j in pairs(Inventory.Clothes) do
            if Inventory.Clothes[j].Name == Item then
                LootItems[Item] = {}
                LootItems[Item]["Type"] = "Clothes"
                LootItems[Item]["Name"] = Item
                LootItems[Item]["Count"] = Utils.Random(1, Config.MaxItemCount)
                LootItems[Item]["Label"] = Inventory.Clothes[j].Label
                LootItems[Item]["Description"] = Inventory.Clothes[j].Description
                LootItems[Item]["Weight"] = Inventory.Clothes[j].Weight
                LootItems[Item]["Limit"] = Inventory.Clothes[j].Limit
            end
        end
    end

    TriggerClientEvent("Inventory:Loot", _Player.Source, Ped, LootItems)
end)
