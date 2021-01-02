local function OnPlayerConnecting(name, setKickReason, deferrals)
    local _Player = Player(source)
    local Identifier = _Player.Identifier()
    
    deferrals.defer()
    Wait(0)

    if not Identifier then
        deferrals.done("You dont have a " .. GlobalConfig.Identifier .." identifier.")
    else
        if (_Player.Exists()) then
            print(name .. " - User Authenticated [" .. Identifier .. "]")
        else
            print(name .. "[" .. Identifier .. "] - Joined for first time to server!")
            Database.ExecuteInsertQuery("INSERT INTO users (Identifier, Nickname, Level, `Group`) VALUES ('" .. Identifier .. "', '" .. name .. "', '1', 'User')")
        end
        deferrals.done()
    end
end
AddEventHandler("playerConnecting", OnPlayerConnecting)

RegisterNetEvent("Player:Spawned")
AddEventHandler("Player:Spawned", function()
    local _Player = Player(source)
    local Identifier = _Player.Identifier()

    local Data = _Player.GetIdentity()
    local Validation = 0
    for Key, Value in pairs(Data) do
        if Data[Key] ~= nil and Data[Key]:match("%S") ~= nil then
            Validation = Validation + 1
        end
    end

    if Validation == 4 then
        Database.ExecuteSelectQuery("SELECT Sex, Skin, Position FROM users WHERE Identifier = @Identifier", {
            ["@Identifier"] = Identifier
        }, function(Result)
            local Sex = Result[1]["Sex"]
            local Skin = json.decode(Result[1]["Skin"])
            local Position = json.decode(Result[1]["Position"])
            local PlayerInventory = _Player.GetInventory()
            TriggerClientEvent("Inventory:PlayerInventory", _Player.Source, PlayerInventory)
            TriggerClientEvent("Player:LoadPlayer", _Player.Source, Sex, Skin, Position)
        end)
    else
        TriggerClientEvent("Identity:Register", _Player.Source)
    end
    TriggerClientEvent("Inventory:UpdateDrop", -1, Inventory.Drop, Inventory.DropId)
    TriggerClientEvent("Inventory:CreateDrop", _Player.Source, Inventory.Drop)
end)

RegisterNetEvent("Player:Position")
AddEventHandler("Player:Position", function(Data)
    local _Player = Player(source)
    local Identifier = _Player.Identifier()

    Database.ExecuteUpdateQuery("UPDATE users SET Position = @Position WHERE Identifier = @Identifier", {
        ["@Identifier"] = Identifier,
        ["@Position"] = json.encode(Data)
    })
end)

RegisterNetEvent("Player:Reset")
AddEventHandler("Player:Reset", function()
    local _Player = Player(source)
    local Identifier = _Player.Identifier()
    local PlayerSkin = _Player.GetSkin()
    local InventoryVoid = {}

    PlayerSkin.Hat = nil
    PlayerSkin.Glasses = nil
    PlayerSkin.Earrings = nil
    PlayerSkin.Watch = nil
    PlayerSkin.Bracelet = nil
    PlayerSkin.Mask = nil
    PlayerSkin.Accessory = nil
    PlayerSkin.Tshirt = nil
    PlayerSkin.Gloves = nil
    PlayerSkin.Armor = nil
    PlayerSkin.Bag = nil
    PlayerSkin.Pants = nil
    PlayerSkin.Shoes = nil

    Database.ExecuteUpdateQuery("UPDATE users SET Inventory = @Inventory, Skin = @Skin WHERE Identifier = @Identifier", {
        ["@Identifier"] = Identifier,
        ["@Inventory"] = json.encode(InventoryVoid),
        ["@Skin"] = json.encode(PlayerSkin)
    })
    TriggerClientEvent("Inventory:UpdatePlayerInventory", _Player.Source, InventoryVoid)
end)