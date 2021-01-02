Skin = {}

Register.Command("on", "None", function(Source, Arguments, RawCommand)
    TriggerClientEvent("Skin:on", Source)
end, "Delete your current character")

Register.Command("off", "None", function(Source, Arguments, RawCommand)
    TriggerClientEvent("Skin:off", Source)
end, "Delete your current character")
