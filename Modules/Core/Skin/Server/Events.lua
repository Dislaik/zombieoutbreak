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
AddEventHandler("Skin:SetClothes", function(Clothes, DrawableId)
    local _Player = Player(source)
    local Identifier = _Player.Identifier()
    local PlayerSkin = _Player.GetSkin()

    if Clothes == 0 then
        PlayerSkin["Hat"] = DrawableId
    elseif Clothes == 1 then
        PlayerSkin["Tshirt"] = DrawableId
    elseif Clothes == 2 then
        PlayerSkin["Gloves"] = DrawableId
    elseif Clothes == 3 then
        PlayerSkin["Pants"] = DrawableId
    elseif Clothes == 4 then
        PlayerSkin["Shoes"] = DrawableId
    end

    Database.ExecuteUpdateQuery("UPDATE users SET Skin = @Skin WHERE Identifier = @Identifier", {
        ["@Identifier"] = Identifier,
        ["@Skin"] = json.encode(PlayerSkin)
    })
end)

RegisterNetEvent("Skin:DeleteClothes")
AddEventHandler("Skin:DeleteClothes", function(Clothes)
    local _Player = Player(source)
    local Identifier = _Player.Identifier()
    local PlayerSkin = _Player.GetSkin()

    if Clothes == 0 then
        PlayerSkin["Hat"] = nil
    elseif Clothes == 1 then
        PlayerSkin["Tshirt"] = nil
    elseif Clothes == 2 then
        PlayerSkin["Gloves"] = nil
    elseif Clothes == 3 then
        PlayerSkin["Pants"] = nil
    elseif Clothes == 4 then
        PlayerSkin["Shoes"] = nil
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
