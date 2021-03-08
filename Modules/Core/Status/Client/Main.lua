local values = {
    ["health"] = GetEntityHealth(PlayerPedId())
    ["armour"] = GetPedArmour(PlayerPedId())
    ["hunger"] = 100,
    ["thirst"] = 100,
    ["oxy"] = 100,
    ["sanity"] = 100,
    ["infection"] = 0
    ["Drunk"] = 0,
    ["Sleep"] = 100,
    ["Bleeding"] = false,
}

SetInterval(10000, function()
        for i=0,4 do
            values = values - 1
            TriggerServerEvent("framework:status:save", values)
            --SendNuiMessage(jsonString)
        end
end)