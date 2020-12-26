Database = {}
UsableItems = {}

function Database.ExecuteInsertQuery(Query)
    MySQL.ready(function ()
        MySQL.Async.execute(Query)
    end)
end

function Database.ExecuteUpdateQuery(Query, Params)
    MySQL.ready(function ()
        MySQL.Async.execute(Query, Params)
    end)
end

function Database.ExecuteSelectQuery(Query, Params, CB)
    MySQL.ready(function ()
        MySQL.Async.fetchAll(Query, Params, function(Result)
            CB(Result)
        end)
    end)
end

function Register.Command(Command, Group, CB, Suggestion, Description)
    RegisterCommand(Command, function(source, args, rawCommand)
        local PlayerSource = Player(source)
        local Identifier = PlayerSource.Identifier()
        if (Group == PlayerSource.GetGroup() or Group == "None") then
            CB(source, args, rawCommand)
        end
    end, false)
    TriggerClientEvent("chat:addSuggestion", -1, "/".. Command, Suggestion, Description)
end

Register.Item = function(Name, CB)
    UsableItems[Name] = CB
end