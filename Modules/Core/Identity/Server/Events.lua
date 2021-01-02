LoadModuleTranslations("Data/Locales/".. GlobalConfig.Lang ..".lua")
local Config = LoadModuleConfig("Data/Config.lua")

RegisterNetEvent("Identity:CreateIdentity")
AddEventHandler("Identity:CreateIdentity", function(Data)
    local _Player = Player(source)
    local Identifier = _Player.Identifier()

    Database.ExecuteUpdateQuery("UPDATE users SET Name = @Name, `Date Of Birth` = @DateOfBirth, Sex = @Sex, Occupation = @Occupation, Skills = @Skills, Faction = @Faction, Money = @Money, Inventory = @Inventory, Skin = @Skin, Position = @Position WHERE Identifier = @Identifier", {
        ["@Identifier"] = Identifier,
        ["@Name"] = Data["FirstName"] .. " " .. Data["LastName"],
        ["@DateOfBirth"] = Data["DateOfBirth"],
        ["@Sex"] = Data["Sex"],
        ["@Occupation"] = Data["Occupation"],
        ["@Skills"] = "{}",
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
