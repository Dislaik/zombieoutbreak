RegisterEvent("Sound:Coords", function(Module, Resource, Name, Volume, Coords, Loop)
    TriggerClientEvent("Sound:Coords", -1, Module, Resource, Name, Volume, Coords, Loop)
end)

RegisterEvent("Sound:Entity", function(Module, Resource, Name, Volume, Entity, Loop)
    TriggerClientEvent("Sound:Entity", -1, Module, Resource, Name, Volume, Entity, Loop)
end)