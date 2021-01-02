SoundsCoords = {}
SoundsEntity = {}

SetInterval(10, function()
    for i, Sound in pairs(SoundsCoords) do
        print(i,Sound)
        local Distance = Vdist(GetEntityCoords(PlayerPedId()), Sound.Coords.x, Sound.Coords.y, Sound.Coords.z)
        local VolumeProximity = (Sound.Volume - Distance)
        SendNUIMessage({
            Type = "Update",
            Index = i,
            Volume = VolumeProximity, 
            PlayerCoords = GetEntityCoords(PlayerPedId())
        })
    end
end)

SetInterval(10, function()
    for i, Sound in pairs(SoundsEntity) do
        local Coords = GetEntityCoords(Sound.Entity)
        local Distance = Vdist(GetEntityCoords(PlayerPedId()), Coords.x, Coords.y, Coords.z)
        local VolumeProximity = (Sound.Volume - Distance)
        SendNUIMessage({
            Type = "Update",
            Index = i,
            Volume = VolumeProximity, 
            PlayerCoords = GetEntityCoords(PlayerPedId())
        })
    end
end)