LoadModuleTranslations("Data/Locales/".. GlobalConfig.Lang ..".lua")
local Config = LoadModuleConfig("Data/Config.lua")

Register.Command("delchar", "None", function(Source, Arguments, RawCommand)
    TriggerClientEvent("Identity:Delete", Source)
end, "Delete your current character")