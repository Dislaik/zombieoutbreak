local Player = M("Player")

function Module:command(command, group, cb, suggestion, description)

    RegisterCommand(command, function(source, args, rawCommand)
        if (group == Player:getPlayer(source):getGroup() or group == "none") then
            cb(source, args, rawCommand)
        end

        TriggerClientEvent("chat:addSuggestion", source, "/".. command, suggestion, description)
    end, false)
    --TriggerClientEvent("chat:addSuggestion", -1, "/".. command, Suggestion, Description)
end

function Module:item(name, cb)
    itemName = string.lower(name)
    UsableItems[itemName] = cb
end