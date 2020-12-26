RegisterNetEvent("Sound:Coords")
AddEventHandler("Sound:Coords", function(Module, Resource, Name, Volume, Coords, Loop)
    TriggerClientEvent("Sound:Coords", -1, Module, Resource, Name, Volume, Coords, Loop)
end)

RegisterNetEvent("Sound:Entity")
AddEventHandler("Sound:Entity", function(Module, Resource, Name, Volume, Entity, Loop)
    TriggerClientEvent("Sound:Entity", -1, Module, Resource, Name, Volume, Entity, Loop)
end)