RegisterNetEvent("Identity:CreateIdentity")
AddEventHandler("Identity:CreateIdentity", function(Data)
    local _Player = Player(source)
    local Identifier = _Player.Identifier()

    Database.ExecuteUpdateQuery("UPDATE users SET Name = @Name, `Date Of Birth` = @DateOfBirth, Sex = @Sex, Level = @Level, Occupation = @Occupation, Skills = @Skills, `Group` = @Group, Faction = @Faction, Money = @Money, Inventory = @Inventory, Skin = @Skin, Position = @Position WHERE Identifier = @Identifier", {
        ["@Identifier"] = Identifier,
        ["@Name"] = Data["FirstName"] .. " " .. Data["LastName"],
        ["@DateOfBirth"] = Data["DateOfBirth"],
        ["@Sex"] = Data["Sex"],
        ["@Level"] = 1,
        ["@Occupation"] = Data["Occupation"],
        ["@Skills"] = "{}",
        ["@Group"] = "User",
        ["@Faction"] = "Survivor",
        ["@Money"] = 0,
        ["@Inventory"] = "{}",
        ["@Skin"] = "{}",
        ["@Position"] = "{}"
    })
end)

RegisterNetEvent("Identity:OccupationSuit")
AddEventHandler("Identity:OccupationSuit", function(Sex)
    local _Player = Player(source)
    local Occupation = _Player.GetOccupation()
    if Config.Occupations[Occupation] then
        for i in pairs(Config.Occupations[Occupation].Clothes) do
            Wait(100)
            _Player.AddItem(Config.Occupations[Occupation].Clothes[i], 1)
            TriggerClientEvent("Identity:SetOccupationClothes", _Player.Source, Config.Occupations[Occupation].Clothes[i], Sex)
        end
    end
end)