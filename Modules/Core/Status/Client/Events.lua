RegisterNetEvent("framework:status:client:change")
AddEventHandler("framework:status:client:change", function(pType, pAmount, pPositive)
    if not pPositive then
        values[tostring(pType)] = values[tostring(pType)] - pAmount or pAmount - values[tostring(pType)]
    else
        values[tostring(pType)] = values[tostring(pType)] + pAmount
    end
end)

RegisterNetEvent("framework:status:client:set")
AddEventHandler("framework:status:client:set", function(pValue)
    values = pValue
end)

RegisterNetEvent("framework:status:client:fill")
AddEventHandler("framework:status:client:fill", function()
    values = {["health"] = 200,["armour"] = 100,["hunger"] = 100,["thirst"] = 100,["oxy"] = 100, ["sanity"] = 100}
end)