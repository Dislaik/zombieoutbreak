local Utils = M("Utils")
local Inventory = M("Inventory")
--[[
Module.Properties = function(source)
    local self = {}

    self.Source = source    

    self.Identifier = function()
        local Identifier
        for k, v in ipairs(GetPlayerIdentifiers(self.Source)) do
            if string.match(v, Config.Identifier) then
                Identifier = v
                return Identifier
            end
        end
    end

    self.Exists = function()
        local Identifier = self.Identifier()
        local Data
        Database.ExecuteSelectQuery("SELECT ID FROM users WHERE Identifier = @Identifier", {
            ["@Identifier"] = Identifier
        }, function(Result)
            if (Result[1] ~= nil) then
                Data = true
            else
                Data = false
            end
        end)
        while Data == nil do Wait(0) end
        return Data
    end

    self.GetIdentity = function()
        local Identifier = self.Identifier()
        local Data
        Database.ExecuteSelectQuery("SELECT Name, Sex, Occupation FROM users WHERE Identifier = @Identifier", {
            ["@Identifier"] = Identifier
        }, function(Result)
            Data = Result[1]
        end)
        while Data == nil do Wait(0) end
        return Data
    end

    self.GetName = function()
        local Identifier = self.Identifier()
        local Data
        Database.ExecuteSelectQuery("SELECT Name FROM users WHERE Identifier = @Identifier", {
            ["@Identifier"] = Identifier
        }, function(Result)
            Data = Result[1]["Name"]
        end)
        while Data == nil do Wait(0) end
        return Data
    end

    self.GetSex = function()
        local Identifier = self.Identifier()
        local Data
        Database.ExecuteSelectQuery("SELECT Sex FROM users WHERE Identifier = @Identifier", {
            ["@Identifier"] = Identifier
        }, function(Result)
            Data = Result[1]["Sex"]
        end)
        while Data == nil do Wait(0) end
        return Data
    end

    self.GetGroup = function()
        local Identifier = self.Identifier()
        local Data
        Database.ExecuteSelectQuery("SELECT `Group` FROM users WHERE Identifier = @Identifier", {
            ["@Identifier"] = Identifier
        }, function(Result)
            Data = Result[1]["Group"]
        end)
        while Data == nil do Wait(0) end
        return Data
    end

    self.GetOccupation = function()
        local Identifier = self.Identifier()
        local Data
        Database.ExecuteSelectQuery("SELECT Occupation FROM users WHERE Identifier = @Identifier", {
            ["@Identifier"] = Identifier
        }, function(Result)
            Data = Result[1]["Occupation"]
        end)
        while Data == nil do Wait(0) end
        
        return Data
    end

    self.GetInventory = function()
        local Identifier = self.Identifier()
        local Data
        Database.ExecuteSelectQuery("SELECT Inventory FROM users WHERE Identifier = @Identifier", {
            ["@Identifier"] = Identifier
        }, function(Result)
            Data = Result[1]["Inventory"]
        end)
        while Data == nil do Wait(0) end
        local PlayerInventory = json.decode(Data)
        Inventory.RedefinePlayerItems(PlayerInventory)

        return PlayerInventory
    end

    self.GetSkin = function()
        local Identifier = self.Identifier()
        local Data
        Database.ExecuteSelectQuery("SELECT Skin FROM users WHERE Identifier = @Identifier", {
            ["@Identifier"] = Identifier
        }, function(Result)
            Data = Result[1]["Skin"]
        end)
        while Data == nil do Wait(0) end
        local PlayerSkin = json.decode(Data)

        return PlayerSkin
    end

    self.AddItem = function(Item, Count)
        if Inventory.PreventItem(Inventory.Items, Item) or Inventory.PreventItem(Inventory.Clothes, Item) then
            local PlayerInventory = Inventory.GetPlayerItems(self.Source)
            local Found = false
            for i in pairs(PlayerInventory) do
                if i == Item then   
                    PlayerInventory[i] = PlayerInventory[i] + Count
                    Found = true
                    break
                end
            end
            if not Found then
                PlayerInventory[Item] = Count
            end
            Inventory.Update(self.Source, PlayerInventory)
        else
            print("^3[Warning]^7Item ^5[".. Item .."]^7 doesn't exists in database")
        end
    end

    self.RemoveItem = function(Item, Count)
        if Inventory.PreventItem(Inventory.Items, Item) or Inventory.PreventItem(Inventory.Clothes, Item) then
            local PlayerInventory = Inventory.GetPlayerItems(self.Source)
            for i in pairs(PlayerInventory) do
                if i == Item then   
                    PlayerInventory[i] = PlayerInventory[i] - Count
                    break
                end
            end
            if PlayerInventory[Item] < 1 then
                PlayerInventory[Item] = nil
            end

            Inventory.Update(self.Source, PlayerInventory)
        else
            print("^3[Warning]^7Item ^5[".. Item .."]^7 doesn't exists in database")
        end
    end

    self.CanCarryItem = function(Item, Count)
        if Inventory.PreventItem(Inventory.Items, Item) or Inventory.PreventItem(Inventory.Clothes, Item) then
            local PlayerInventory = self.GetInventory()
            local Found = false
            for i in pairs(PlayerInventory) do
                if i == Item then
                    Found = true
                    if PlayerInventory[i].Limit >= (PlayerInventory[i].Count + Count) then
                        return true
                    end
                end
            end
            if not Found then
                return true
            end

            return false
        else
            print("^3[Warning]^7Item ^5[".. Item .."]^7 doesn't exists in database")
        end
    end

    self.HasItem = function(Item)
        if Inventory.PreventItem(Inventory.Items, Item) or Inventory.PreventItem(Inventory.Clothes, Item) then
            local PlayerInventory = Inventory.GetPlayerItems(self.Source)
            for i in pairs(PlayerInventory) do
                if i == Item then
                    return true, PlayerInventory[i]
                end
            end
        else
            print("^3[Warning]^Item ^5[".. Item .."]^7 doesn't exists in database")
        end

        return false, 0
    end

    self.AddWeapon = function(WeaponName, Ammo, Components, Tint)
        if Inventory.PreventItem(Inventory.Weapons, WeaponName) then
            Ammo = Ammo or 0
            Components = Components or nil
            Tint = Tint or 0

            local PlayerInventory = Inventory.GetPlayerItems(self.Source)
            local Found = false
            for i in pairs(PlayerInventory) do
                if i == WeaponName then
                    PlayerInventory[WeaponName]["Ammo"] = Ammo
                    PlayerInventory[WeaponName]["Components"] = Components
                    PlayerInventory[WeaponName]["Tint"] = Tint
                    Found = true
                    break
                end
            end
            if not Found then
                PlayerInventory[WeaponName] = {}
                PlayerInventory[WeaponName]["Ammo"] = Ammo
                PlayerInventory[WeaponName]["Components"] = Components
                PlayerInventory[WeaponName]["Tint"] = Tint
            end

            Inventory.Update(self.Source, PlayerInventory)
        else
            print("^3[Warning]^7Weapon ^5[".. WeaponName .."]^7 doesn't exists in database")
        end
    end

    self.RemoveWeapon = function(WeaponName)
        if Inventory.PreventItem(Inventory.Weapons, WeaponName) then

            local PlayerInventory = Inventory.GetPlayerItems(self.Source)
            for i in pairs(PlayerInventory) do
                if i == WeaponName then   
                    PlayerInventory[i] = nil
                    break
                end
            end

            Inventory.Update(self.Source, PlayerInventory)
        else
            print("^3[Warning]^7Weapon ^5[".. WeaponName .."]^7 doesn't exists in database")
        end
    end

    self.AddWeaponAmmo = function(WeaponName, Ammo)
        if Inventory.PreventItem(Inventory.Weapons, Name) then

            local PlayerInventory = Inventory.GetPlayerItems(self.Source)
            for i in pairs(PlayerInventory) do
                if i == WeaponName then   
                    PlayerInventory[WeaponName]["Ammo"] = PlayerInventory[WeaponName]["Ammo"] + Ammo
                    break
                end
            end

            Inventory.Update(self.Source, PlayerInventory)
        else
            print("^3[Warning]^7Weapon ^5[".. WeaponName .."]^7 doesn't exists in database")
        end
    end

    self.RemoveWeaponAmmo = function(WeaponName, Ammo)
        if Inventory.PreventItem(Inventory.Weapons, WeaponName) then

            local PlayerInventory = Inventory.GetPlayerItems(self.Source)
            for i in pairs(PlayerInventory) do
                if i == WeaponName then   
                    PlayerInventory[WeaponName]["Ammo"] = PlayerInventory[WeaponName]["Ammo"] - Ammo
                    break
                end
            end

            Inventory.Update(self.Source, PlayerInventory)
        else
            print("^3[Warning]^7Weapon ^5[".. WeaponName .."]^7 doesn't exists in database")
        end
    end

    self.HasWeapon = function(WeaponName)
        if Inventory.PreventItem(Inventory.Weapons, WeaponName) then
            local PlayerInventory = Inventory.GetPlayerItems(self.Source)
            for i in pairs(PlayerInventory) do
                if i == WeaponName then
                    return true
                end
            end
        else
            print("^3[Warning]^Weapon ^5[".. WeaponName .."]^7 doesn't exists in database")
        end

        return false
    end

    self.CurrentWeight = function()
        local Weight = 0.0
        local PlayerInventory = self.GetInventory()

        for i in pairs(PlayerInventory) do
            if PlayerInventory[i].Type == "Item" then
                Weight = (Weight + (PlayerInventory[i].Weight * PlayerInventory[i].Count))
            elseif PlayerInventory[i].Type == "Weapon" then
                Weight = (Weight + PlayerInventory[i].Weight)
            end
        end

        return Weight
    end

    self.ShowNotification = function(Message)
        TriggerClientEvent("Player:ShowNotification", self.Source, Message)
    end

    return self
end
--]]


function Module:getPlayer(source)
    local self = {}

    self.source = source

    function self:getIdentifier()
        for k, v in ipairs(GetPlayerIdentifiers(self.source)) do
            if string.match(v, Config.Identifier) then
                return Utils.split(v, ":")[2]
            end
        end
    end

    function self:alreadyOnDB()
        local identifier, data = self:getIdentifier(), nil

        Database.ExecuteSelectQuery("SELECT id FROM users WHERE identifier = @identifier", {
            ["@identifier"] = identifier
        }, function(result); if (result[1] ~= nil) then data = true else data = false end
        end); while data == nil do Wait(0); end

        return data
    end

    function self:getGroup()
        local identifier, data = self:getIdentifier(), nil

        Database.ExecuteSelectQuery("SELECT `group` FROM users WHERE identifier = @identifier", {
            ["@identifier"] = identifier
        }, function(result); data = result[1].group
        end); while data == nil do Wait(0); end

        return data
    end

    function self:getInformation()
        local identifier, timeOut, data = self:getIdentifier(), 0, nil

        Database.ExecuteSelectQuery("SELECT information FROM users WHERE identifier = @identifier", {
            ["@identifier"] = identifier
        }, function(result); data = result[1].information
        end); while data == nil and timeOut < 20 do; Wait(0); timeOut = timeOut + 1; end
        if data == nil then; return nil; end

        return json.decode(data)
    end

    function self:getPosition()
        local identifier, timeOut, data = self:getIdentifier(), 0, nil

        Database.ExecuteSelectQuery("SELECT position FROM users WHERE identifier = @identifier", {
            ["@identifier"] = identifier
        }, function(result); data = result[1].position
        end); while data == nil and timeOut < 20 do; Wait(0); timeOut = timeOut + 1; end
        if data == nil then; return nil; end

        return vector3(json.decode(data).x, json.decode(data).y, json.decode(data).z)
    end

    function self:getSkin()
        local identifier, timeOut, data = self:getIdentifier(), 0, nil

        Database.ExecuteSelectQuery("SELECT skin FROM users WHERE identifier = @identifier", {
            ["@identifier"] = identifier
        }, function(result); data = result[1].skin
        end); while data == nil and timeOut < 20 do; Wait(0); timeOut = timeOut + 1; end
        if data == nil then; return nil; end

        return json.decode(data)
    end

    function self:getInventory()
        local identifier, timeOut, data = self:getIdentifier(), 0, nil

        Database.ExecuteSelectQuery("SELECT inventory FROM users WHERE identifier = @identifier", {
            ["@identifier"] = identifier
        }, function(result); data = result[1].inventory
        end); while data == nil and timeOut < 20 do; Wait(0); timeOut = timeOut + 1; end
        if data == nil or data == "" then; print("nul") return nil; end

        local inventory = json.decode(data)
        local redefineInventory = {}
        
        for i = 1, #inventory do
            redefineInventory[i] = {}
            for k, v in pairs(inventory[i]) do
                redefineInventory[i][Utils.firstToUpper(k)] = v
            end
        end

        return redefineInventory
    end

    function self:getStatus()
        local identifier, timeOut, data = self:getIdentifier(), 0, nil

        Database.ExecuteSelectQuery("SELECT status FROM users WHERE identifier = @identifier", {
            ["@identifier"] = identifier
        }, function(result); data = result[1].status
        end); while data == nil and timeOut < 20 do; Wait(0); timeOut = timeOut + 1; end
        if data == nil then; return nil; end

        return json.decode(data)
    end

    function self:addInventoryItem(item, amount)
        local identifier, inventory = self:getIdentifier(), self:getInventory()
        local newInventory = {}

        local itemTarget = Utils.toLowerCase(item)
        local found = false

        for i in pairs(Items) do
            if Utils.toLowerCase(i) == itemTarget then
                newInventory.name = itemTarget

                if Items[i].UseCondition then
                    newInventory.condition = 100.0
                end

                found = true
                break
            end
        end

        if not found then
            return print("Error Items doesn't exist")
        end

        local redefineInventory = {}

        if inventory then
            for i = 1, #inventory do
                redefineInventory[i] = {}
                for k, v in pairs(inventory[i]) do
                    redefineInventory[i][string.lower(k)] = v
                end
            end
        end

        if not inventory then
            inventory = {}

            inventory[#inventory + 1] = newInventory

            Database.ExecuteUpdateQuery("UPDATE users SET inventory = @inventory WHERE identifier = @identifier", {
                ["@identifier"] = identifier,
                ["@inventory"] = json.encode(inventory)
            })
        else
            redefineInventory[#redefineInventory + 1] = newInventory

            Database.ExecuteUpdateQuery("UPDATE users SET inventory = @inventory WHERE identifier = @identifier", {
                ["@identifier"] = identifier,
                ["@inventory"] = json.encode(redefineInventory)
            })
        end

    end

    return self
end