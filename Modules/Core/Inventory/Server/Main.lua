Inventory.Drop = {}
Inventory.DropId = 0
Inventory.VisualDrop = {}

Database.ExecuteSelectQuery("SELECT * FROM items", {},
    function(Result)
    Inventory.Items = Result
end)

Database.ExecuteSelectQuery("SELECT * FROM weapons", {},
    function(Result)
    Inventory.Weapons = Result
end)

Database.ExecuteSelectQuery("SELECT * FROM clothes", {},
    function(Result)
    Inventory.Clothes = Result
end)

Inventory.Update = function(Source, PlayerInventory)
    local _Player = Player(Source)
    local Identifier = _Player.Identifier()

    Database.ExecuteUpdateQuery("UPDATE users SET Inventory = @Inventory WHERE Identifier = @Identifier", {
        ["@Identifier"] = Identifier,
        ["@Inventory"] = json.encode(PlayerInventory)
    })

    Inventory.RedefineItems(PlayerInventory)

    TriggerClientEvent("Inventory:UpdatePlayerInventory", _Player.Source, PlayerInventory)
end

Inventory.RedefineItems = function(PlayerInventory)
    for i in pairs(PlayerInventory) do
        for j in pairs(Inventory.Items) do
            if i == Inventory.Items[j].Name then
                local TemporaryCount = PlayerInventory[i]
                PlayerInventory[i] = {}
                PlayerInventory[i]["Type"] = "Item"
                PlayerInventory[i]["Name"] = i
                PlayerInventory[i]["Count"] = TemporaryCount
                PlayerInventory[i]["Label"] = Inventory.Items[j].Label
                PlayerInventory[i]["Description"] = Inventory.Items[j].Description
                PlayerInventory[i]["Weight"] = Inventory.Items[j].Weight
                PlayerInventory[i]["Limit"] = Inventory.Items[j].Limit
            end
        end

        for j in pairs(Inventory.Weapons) do
            if i == Inventory.Weapons[j].Name then
                local TemporaryAmmo = PlayerInventory[i].Ammo
                local TemporaryComponents = PlayerInventory[i].Components
                local TemporaryTint = PlayerInventory[i].Tint
                PlayerInventory[i] = {}
                PlayerInventory[i]["Type"] = "Weapon"
                PlayerInventory[i]["Name"] = i
                PlayerInventory[i]["Label"] = Inventory.Weapons[j].Label
                PlayerInventory[i]["Description"] = Inventory.Weapons[j].Description
                PlayerInventory[i]["Weight"] = Inventory.Weapons[j].Weight
                PlayerInventory[i]["Ammo"] = TemporaryAmmo
                PlayerInventory[i]["Components"] = TemporaryComponents
                PlayerInventory[i]["Tint"] = TemporaryTint
            end
        end

        for j in pairs(Inventory.Clothes) do
            if i == Inventory.Clothes[j].Name then
                local TemporaryCount = PlayerInventory[i]
                PlayerInventory[i] = {}
                PlayerInventory[i]["Type"] = "Clothes"
                PlayerInventory[i]["Name"] = i
                PlayerInventory[i]["Count"] = TemporaryCount
                PlayerInventory[i]["Label"] = Inventory.Clothes[j].Label
                PlayerInventory[i]["Description"] = Inventory.Clothes[j].Description
                PlayerInventory[i]["Weight"] = Inventory.Clothes[j].Weight
                PlayerInventory[i]["Limit"] = Inventory.Clothes[j].Limit
            end
        end
    end
end

Inventory.PreventItem = function(Inventory, Name)
    for i in pairs(Inventory) do
        if Inventory[i].Name == Name then
            return true
        end
    end
    
    return false
end

Inventory.GetPlayerItems = function(Source)
    local _Player = Player(Source)
    local Identifier = _Player.Identifier()
    local Data
    Database.ExecuteSelectQuery("SELECT Inventory FROM users WHERE Identifier = @Identifier", {
        ["@Identifier"] = Identifier
    }, function(Result)
        Data = Result[1]["Inventory"]
    end)
    while Data == nil do Wait(0) end
    return json.decode(Data)
end

Inventory.GetItemLabel = function(Name)
    for i in pairs(Inventory.Items) do
        if Inventory.Items[i].Name == Name then
            return Inventory.Items[i].Label
        end
    end
end