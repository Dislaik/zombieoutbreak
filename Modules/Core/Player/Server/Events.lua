--[[local Inventory = New("Inventory")--]]
local Skin = M("Skin")

local firstConnection

AddEventHandler("playerConnecting", function(name, setKickReason, deferrals)
    local player = Module:getPlayer(source)
    local identifier = player:getIdentifier()
    
    deferrals.defer()
    Wait(0)

    if not identifier then
        deferrals.done("You dont have a ".. Config.Identifier .." identifier.")
    else
        if (player:alreadyOnDB()) then
            print(name .. " - User Authenticated [".. identifier .."]")
            firstConnection = false
        else
            print(name .."[".. identifier .."] - Joined for first time to the server!")
            Database.ExecuteInsertQuery("INSERT INTO users (identifier, nickname, `group`) VALUES ('" .. identifier .. "', '" .. name .. "', 'user')")
            firstConnection = true
        end
        deferrals.done()
    end
end)

RegisterEvent("Player:Instance", function()
    TriggerClientEvent("Player:Instance", -1)
end)

RegisterEvent("Player:Spawned", function()
    local player = Module:getPlayer(source)
    local identifier = player:getIdentifier()
    local information = player:getInformation()
    local validation = 0
    --local validationLimit = ? --get from character module
    if information then
        for k, v in pairs(information) do
            if v ~= nil and v:match("%S") ~= nil then
                validation = validation + 1
            end
        end
    end

    if validation == 4 then
        local gender = player:getInformation().gender
        local skin = player:getSkin()
        local status = player:getStatus()
        local position = player:getPosition()
        local inventory = player:getInventory()

        TriggerClientEvent("Inventory:PlayerInventory", player.source, inventory)
        TriggerClientEvent("Player:LoadPlayer", player.source, gender, status, skin, position)
    else
        --TriggerClientEvent("Player:LoadedInstance", -1)
        TriggerClientEvent("Player:Register", player.source, firstConnection)
    end

    --TriggerClientEvent("Inventory:UpdateDrop", -1, Inventory.Drop, Inventory.DropId)
    --TriggerClientEvent("Inventory:CreateDrop", _Player.Source, Inventory.Drop)
end)

RegisterEvent("Player:SetPositionData", function(data)
    local player = Module:getPlayer(source)
    local identifier = player:getIdentifier()

    Database.ExecuteUpdateQuery("UPDATE users SET position = @position WHERE identifier = @identifier", {
        ["@identifier"] = identifier,
        ["@position"] = json.encode(data)
    })
end)
--[[
RegisterNetEvent("Player:Reset")
AddEventHandler("Player:Reset", function()
    local _Player = Module.Properties(source)
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
end)--]]

RegisterEvent("Player:SetDataCharacter", function(data)
    local identifier = Module:getPlayer(source):getIdentifier()
    local information = {}

    information.name = data.firstname .." ".. data.lastname
    information.gender = Skin.GetModelSex(data.model)
    information.occupation = data.occupation
    information.faction = "survivor"

    Database.ExecuteUpdateQuery("UPDATE users SET information = @information WHERE identifier = @identifier", {
        ["@identifier"] = identifier,
        ["@information"] = json.encode(information)
    })

end)