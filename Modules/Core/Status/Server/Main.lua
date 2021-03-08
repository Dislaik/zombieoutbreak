RegisterNetEvent("framework:status:server:save")
AddEventHandler("framework:status:server:save", function(pValue)
    local _Player = Player(source)
    local Identifier = _Player.Identifier()

    Database.ExecuteUpdateQuery("UPDATE users SET status = @status WHERE Identifier = @Identifier", {["@Identifier"] = Identifier, ["@status"] = json.encode(pValue)})
end)

RegisterNetEvent("framework:status:server:set")
AddEventHandler("framework:status:server:set", function(pSource)
    local _Player = Player(pSource)
    local Identifier = _Player.Identifier()
    local status
    Database.ExecuteSelectQuery("SELECT status FROM users WHERE Identifier = @Identifier", {["@Identifier"] = Identifier}, function(pResult)
        if pResult[1] ~= nil then
            status = pResult[1].status
        end
    end)
    
    TriggerClientEvent("framework:status:client:set", _Player.source, json.decode(status))
end)