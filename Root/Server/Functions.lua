Database = {}

Database.ExecuteInsertQuery = function(Query)
    MySQL.ready(function ()
        MySQL.Async.execute(Query)
    end)
end

Database.ExecuteUpdateQuery = function(Query, Params)
    MySQL.ready(function ()
        MySQL.Async.execute(Query, Params)
    end)
end

Database.ExecuteSelectQuery = function(Query, Params, CB)
    MySQL.ready(function ()
        MySQL.Async.fetchAll(Query, Params, function(Result)
            CB(Result)
        end)
    end)
end



--[[
TriggerEventOnClient = function(eventName, playerId, ...)
    local payload = msgpack.pack({...})
    if Root.Events[eventName] then
        return TriggerClientEventInternal(eventName, playerId, payload, payload:len())
    else
        print(eventName .."Not exists")
    end
end--]]