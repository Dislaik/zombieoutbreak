local Player = M("Player")
local Register = M("Register")


--Module.Drop = {}
--Module.DropId = 0
--Module.VisualDrop = {}


Register:item("TEST", function()
    print("Test item")
end)

Register:item("Test2", function()
    print("test 2 item")
end)


--[[
Module.Update = function(Source, PlayerInventory)
    local Player = New("Player")
    local _Player = Player.Properties(Source)
    local Identifier = _Player.Identifier()

    Database.ExecuteUpdateQuery("UPDATE users SET Inventory = @Inventory WHERE Identifier = @Identifier", {
        ["@Identifier"] = Identifier,
        ["@Inventory"] = json.encode(PlayerInventory)
    })

    Module.RedefineItems(PlayerInventory)

    TriggerClientEvent("Inventory:UpdatePlayerInventory", _Player.Source, PlayerInventory)
end


Module.PreventItem = function(Inventory, Name)
    for i in pairs(Inventory) do
        if Inventory[i].Name == Name then
            return true
        end
    end
    
    return false
end

Module.GetPlayerItems = function(Source)
    local Player = New("Player")
    local _Player = Player.Properties(Source)
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

Module.GetItemLabel = function(Name)
    for i in pairs(Module.Items) do
        if Module.Items[i].Name == Name then
            return Module.Items[i].Label
        end
    end
end
--]]