local Player = M("Player")

RegisterEvent("Status:InitStatus", function()
    local player = Player:getPlayer(source)
    local identifier = player:getIdentifier()
    local status = {}

    status.blood = 5000.0
    status.hunger = 100.0
    status.thirst = 100.0

    Database.ExecuteUpdateQuery("UPDATE users SET status = @status WHERE identifier = @identifier", {
        ["@identifier"] = identifier,
        ["@status"] = json.encode(status)
    })

end)