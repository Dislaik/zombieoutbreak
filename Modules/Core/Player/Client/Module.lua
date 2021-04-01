local Utils = M("Utils")
local Status = M("Status")

Module.Translations = Load("Data/Locales/".. Config.Lang ..".lua")["Translations"]
LoadTranslation("Player", Module.Translations)
Module.Config = Load("Data/Config.lua")["Config"]

local loaded = false
local dead = false

Module.loaded = function(bool)
    bool = bool or nil

    if bool then
        loaded = bool
    end

    return loaded
end


function Module:getPlayer()
    local self = {}

    function self:loaded(bool)
        bool = bool or nil

        if bool then
            loaded = bool
        end

        return loaded
    end

    function self:setStatus(table)
        for k,v in pairs(table) do
            Status[k] = v
        end

        Status:loaded(true)
    end

    function self:isDead(bool)
        bool = bool or nil

        if bool then
            dead = bool
        end

        return dead
    end

    function self:isShooting()

    end

    return self
end
--[[
Module.playerPoints = Module.Config.TotalPoints

Module.Occupations = {
    {
        Name = "unemployed",
        Label = Translate("Player:unemployed"),
        Description = "Test description jeje, is necessary create a good shit.",
        PointsCost = 16,
        MajorSkills = {
            {
                Name = "strength",
                Label = Translate("Player:strength"),
                Level = 4
            },
            {
                Name = "resistance",
                Label = Translate("Player:resistance"),
                Level = 3
            }
        }
    },
    {
        Name = "police_officer",
        Label = Translate("Player:police_officer"),
        Description = "Test description jeje, is necessary create a good shit.",
        PointsCost = 18,
        MajorSkills = {
            {
                Name = "strength",
                Label = Translate("Player:strength"),
                Level = 4
            },
            {
                Name = "resistance",
                Label = Translate("Player:resistance"),
                Level = 4
            },
            {
                Name = "accuracy",
                Label = Translate("Player:accuracy"),
                Level = 1
            }
        }
    },
    {
        Name = "paramedic",
        Label = Translate("Player:paramedic"),
        Description = "Test description jeje, is necessary create a good shit.",
        PointsCost = 18,
        MajorSkills = {
            {
                Name = "strength",
                Label = Translate("Player:strength"),
                Level = 4
            },
            {
                Name = "resistance",
                Label = Translate("Player:resistance"),
                Level = 4
            },
            {
                Name = "paramedic",
                Label = Translate("Player:first_aid"),
                Level = 2
            }
        }
    }
}

Module.Traits = {
    Positive = {
        {
            Name = "LowThirst",
            Label = "Low Thirst",
            Description = "You need to drink water less regularly.",
            Points = 4,
            Counter = "HighThirst"
        },
        {
            Name = "PositiveTest",
            Label = "A Positive Test",
            Description = "TEST LOL.",
            Points = 2,
            Counter = "NegativeTest"
        }
    },
    Negative = {
        {
            Name = "HighThirst",
            Label = "High Thirst",
            Description = "You need to drink water more regularly.",
            Points = 4,
            Counter = "LowThirst"
        },
        {
            Name = "NegativeTest",
            Label = "A Negative Test",
            Description = "TEST LOL.",
            Points = 2,
            Counter = "PositiveTest"
        }
    }
}


--[[
Module.Loaded = function(Load)
    if Load ~= nil then
        DecorSetBool(PlayerPedId(), "PLAYER_LOADED", Load)
    end

    return DecorGetBool(PlayerPedId(), "PLAYER_LOADED")
end

Module.Shooting = function(PlayerPed)
    return DecorGetBool(PlayerPed, "PLAYER_SHOOTING")
end

Module.Running = function(PlayerPed)
    return DecorGetBool(PlayerPed, "PLAYER_RUNNING")
end

Module.Driving = function(PlayerPed)
    return DecorGetBool(PlayerPed, "PLAYER_DRIVING")
end

Module.Dead = function(PlayerPed)
    return DecorGetBool(PlayerPed, "PLAYER_DEAD")
end

Module.ShowNotification = function(Message)
    SetNotificationTextEntry('STRING')
	AddTextComponentString(Message)
	DrawNotification(0, 1)
end

Module.SeparateInstance = function(Separate)
    for _, Player in pairs(GetActivePlayers()) do
        local PlayerId = GetPlayerFromServerId(Player)
        local PlayerPed = GetPlayerPed(PlayerId)
        
        if PlayerId ~= -1 then
            SetEntityCollision(PlayerPed, true, true)
            SetEntityVisible(PlayerPed, not Separate, false)
        end
    end
end
--]]
