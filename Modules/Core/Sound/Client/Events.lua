RegisterNetEvent("Sound:Coords")
AddEventHandler("Sound:Coords", function(Module, Resource, Name, Volume, Coords, Loop)
    local i = 0
    while SoundsCoords[i] ~= nil or SoundsEntity[i] ~= nil do i = i + 1 end
    SoundsCoords[i] = {Coords = Coords, Volume = Volume}
    SendNUIMessage({
        Type = "Sound",
        Index = i,
        Module = Module,
        Resource = Resource,
        File = Name,
        Volume = Volume,
        Coords = Coords,
        Loop = Loop
    })
end)

RegisterNetEvent("Sound:Entity")
AddEventHandler("Sound:Entity", function(Module, Resource, Name, Volume, Entity, Loop)
    local i = 0
    while SoundsEntity[i] ~= nil or SoundsCoords[i] ~= nil do i = i + 1 end
    local Coords = GetEntityCoords(Entity)
    SoundsEntity[i] = {Entity = Entity, Volume = Volume}
    SendNUIMessage({
        Type = "Sound",
        Index = i,
        Module = Module,
        Resource = Resource,
        File = Name,
        Volume = Volume,
        Coords = Coords,
        Loop = Loop
    })
end)

RegisterNUICallback("Sound:Remove", function(data)
    if SoundsEntity[data.Index] ~= nil then
        SoundsEntity[data.Index] = nil
    end

    if SoundsCoords[data.Index] ~= nil then
        SoundsCoords[data.Index] = nil
    end
end)