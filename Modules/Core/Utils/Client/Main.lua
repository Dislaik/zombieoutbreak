Utils.GetWeaponNameFromHashKey = function(Hash)
    local Json = GetDataFile("Data/Weapons.json")
    local JsonData = json.decode(Json)
    for i in pairs(JsonData) do
        if Hash == JsonData[i]["hash"] then
            return i
        end
    end
end

Utils.DrawText3D = function(Text, X, Y, Z, _Scale, Font)
    local _ScreenX, _ScreenY = GetActiveScreenResolution()
    _ScreenX = (_ScreenX / 2.0)
    _ScreenY = (_ScreenY / 2.0)
    local OnScreen, _ScreenX, _ScreenY = GetScreenCoordFromWorldCoord(X, Y, Z)
    local PlayerCam = GetFinalRenderedCamCoord()
    local Distance = GetDistanceBetweenCoords(PlayerCam.x, PlayerCam.y, PlayerCam.z, X, Y, Z, true)
    local Scale = ((_Scale / Distance) * 2.0)
    local Fov = ((_Scale / GetGameplayCamFov()) * 100.0)
    Scale = (Scale * Fov)
    if OnScreen then
        SetTextScale(Scale, (Scale + 0.35))
        SetTextFont(Font)
        SetTextProportional(true)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(Text)
        DrawText(_ScreenX, _ScreenY)
    end

end

Utils.RoundDecimal = function(Float, Place)
    local Mult = 10^(Place or 0)
    return math.floor(Float * Mult + 0.5) / Mult
end

Utils.IndividualSoundCoords = function(Module, Resource, Name, Volume, Coords, Loop)
    TriggerEvent("Sound:Coords", Module, Resource, Name, Volume, Coords, Loop)
end

Utils.IndividualSoundEntity = function(Module, Resource, Name, Volume, Entity, Loop)
    TriggerEvent("Sound:Entity", Module, Resource, Name, Volume, Entity, Loop)
end

Utils.UniversalSoundCoords = function(Module, Resource, Name, Volume, Coords, Loop)
    TriggerServerEvent("Sound:Coords", Module, Resource, Name, Volume, Coords, Loop)
end
    
Utils.UniversalSoundEntity = function(Module, Resource, Name, Volume, Entity, Loop)
    TriggerServerEvent("Sound:Entity", Module, Resource, Name, Volume, Entity, Loop)
end

Utils.DrawText = function(Text, X, Y, Scale, Font, Justification, Red, Green, Blue, Alpha, Shadow)
    SetTextScale(Scale, Scale)
    SetTextFont(Font)
    SetTextProportional(true)
    SetTextColour(Red, Green, Blue, Alpha)
    if Shadow then
        SetTextDropshadow(0, 0, 0, 0, 255)
    end
    SetTextDropShadow()
    SetTextOutline();
    SetTextEntry("STRING")
    SetTextJustification(Justification)
    AddTextComponentString(Text)
    DrawText(X, Y)
end

Utils.Particle = function(Asset, Name, X, Y, Z, RotX, RotY, RotZ, Scale)
    Interval(0, function()
        RequestNamedPtfxAsset(Asset)
        while not HasNamedPtfxAssetLoaded(Asset) do
            Wait(1)
        end

        UseParticleFxAssetNextCall(Asset)
        StartParticleFxLoopedAtCoord(Name, X, Y, Z, RotX, RotY, RotZ, Scale, false, false, false, false)
    end)
end

Utils.CreateCamera = function(RotX, RotY, RotZ)
    local i = 0
    while Cam[i] ~= nil do i = i + 1 end
    i = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamActive(i, true)
    RenderScriptCams(true, false, 0, false, false)
    SetCamRot(i, RotX, RotY, RotZ, 2)
    return i
end

Utils.DeleteCamera = function(Cam)
    SetCamActive(Cam, false)
    RenderScriptCams(false, false, 0, false, false)
end

Utils.Random = function(Min, Max)
    return math.random(Min,Max)
end