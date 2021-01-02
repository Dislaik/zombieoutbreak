RegisterNetEvent("Skin:SetPlayerSkin")
AddEventHandler("Skin:SetPlayerSkin", function(Data)
    local _Player = Player(source)
    local Identifier = _Player.Identifier()
    
    Database.ExecuteUpdateQuery("UPDATE users SET Skin = @Skin WHERE Identifier = @Identifier", {
        ["@Identifier"] = Identifier,
        ["@Skin"] = json.encode(Data)
    })
end)

RegisterNetEvent("Skin:SetClothes")
AddEventHandler("Skin:SetClothes", function(Component, DrawableId)
    local _Player = Player(source)
    local Identifier = _Player.Identifier()
    local PlayerSkin = _Player.GetSkin()

    if Component == 0 then
        PlayerSkin.Hat = DrawableId
    elseif Component == 1 then
        PlayerSkin.Glasses = DrawableId
    elseif Component == 2 then
        PlayerSkin.Earrings = DrawableId
    elseif Component == 3 then
        PlayerSkin.Watch = DrawableId
    elseif Component == 4 then
        PlayerSkin.Bracelet = DrawableId
    elseif Component == 5 then
        PlayerSkin.Mask = DrawableId
    elseif Component == 6 then
        PlayerSkin.Accessory = DrawableId
    elseif Component == 7 then
        PlayerSkin.Tshirt = DrawableId
    elseif Component == 8 then
        PlayerSkin.Gloves = DrawableId
    elseif Component == 9 then
        PlayerSkin.Armor = DrawableId
    elseif Component == 10 then
        PlayerSkin.Bag = DrawableId
    elseif Component == 11 then
        PlayerSkin.Pants = DrawableId
    elseif Component == 12 then
        PlayerSkin.Shoes = DrawableId
    end

    Database.ExecuteUpdateQuery("UPDATE users SET Skin = @Skin WHERE Identifier = @Identifier", {
        ["@Identifier"] = Identifier,
        ["@Skin"] = json.encode(PlayerSkin)
    })
end)

RegisterNetEvent("Skin:DeleteClothes")
AddEventHandler("Skin:DeleteClothes", function(Component)
    local _Player = Player(source)
    local Identifier = _Player.Identifier()
    local PlayerSkin = _Player.GetSkin()

    if Component == 0 then
        PlayerSkin.Hat = nil
    elseif Component == 1 then
        PlayerSkin.Glasses = nil
    elseif Component == 2 then
        PlayerSkin.Earrings = nil
    elseif Component == 3 then
        PlayerSkin.Watch = nil
    elseif Component == 4 then
        PlayerSkin.Bracelet = nil
    elseif Component == 5 then
        PlayerSkin.Mask = nil
    elseif Component == 6 then
        PlayerSkin.Accessory = nil
    elseif Component == 7 then
        PlayerSkin.Tshirt = nil
    elseif Component == 8 then
        PlayerSkin.Gloves = nil
    elseif Component == 9 then
        PlayerSkin.Armor = nil
    elseif Component == 10 then
        PlayerSkin.Bag = nil
    elseif Component == 11 then
        PlayerSkin.Pants = nil
    elseif Component == 12 then
        PlayerSkin.Shoes = nil
    end

    Database.ExecuteUpdateQuery("UPDATE users SET Skin = @Skin WHERE Identifier = @Identifier", {
        ["@Identifier"] = Identifier,
        ["@Skin"] = json.encode(PlayerSkin)
    })
end)


RegisterNetEvent("Skin:ClearClothes")
AddEventHandler("Skin:ClearClothes", function()
    local _Player = Player(source)
    local Identifier = _Player.Identifier()
    local PlayerSkin = _Player.GetSkin()

    PlayerSkin["Hat"] = nil
    PlayerSkin["Tshirt"] = nil
    PlayerSkin["Gloves"] = nil
    PlayerSkin["Pants"] = nil
    PlayerSkin["Shoes"] = nil

    Database.ExecuteUpdateQuery("UPDATE users SET Skin = @Skin WHERE Identifier = @Identifier", {
        ["@Identifier"] = Identifier,
        ["@Skin"] = json.encode(PlayerSkin)
    })
end)
