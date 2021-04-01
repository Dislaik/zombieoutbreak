Module.getWeaponNameFromHashKey = function(Hash)
    local Json = GetDataFile("Data/Weapons.json")
    local JsonData = json.decode(Json)
    for i in pairs(JsonData) do
        if Hash == JsonData[i]["hash"] then
            return i
        end
    end
end

Module.drawText3D = function(Text, X, Y, Z, _Scale, Font)
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

Module.individualSoundCoords = function(Module, Resource, Name, Volume, Coords, Loop)
    TriggerEvent("Sound:Coords", Module, Resource, Name, Volume, Coords, Loop)
end

Module.individualSoundEntity = function(Module, Resource, Name, Volume, Entity, Loop)
    TriggerEvent("Sound:Entity", Module, Resource, Name, Volume, Entity, Loop)
end

Module.universalSoundCoords = function(Module, Resource, Name, Volume, Coords, Loop)
    TriggerServerEvent("Sound:Coords", Module, Resource, Name, Volume, Coords, Loop)
end
    
Module.universalSoundEntity = function(Module, Resource, Name, Volume, Entity, Loop)
    TriggerServerEvent("Sound:Entity", Module, Resource, Name, Volume, Entity, Loop)
end

Module.drawText = function(Text, X, Y, Scale, Font, Justification, Red, Green, Blue, Alpha, Shadow)
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

Module.particle = function(Asset, Name, X, Y, Z, RotX, RotY, RotZ, Scale)
    Interval(0, function()
        RequestNamedPtfxAsset(Asset)
        while not HasNamedPtfxAssetLoaded(Asset) do
            Wait(1)
        end

        UseParticleFxAssetNextCall(Asset)
        StartParticleFxLoopedAtCoord(Name, X, Y, Z, RotX, RotY, RotZ, Scale, false, false, false, false)
    end)
end

Module.createCamera = function(RotX, RotY, RotZ)
    local i = 0
    while Cam[i] ~= nil do i = i + 1 end
    i = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamActive(i, true)
    RenderScriptCams(true, false, 0, true, true)
    SetCamRot(i, RotX, RotY, RotZ, 2)
    return i
end

Module.deleteCamera = function(Cam)
    SetCamActive(Cam, false)
    RenderScriptCams(false, false, 0, false, false)
end

Module.setPlayerModel = function(Model)
    local Hash = GetHashKey(Model)

    RequestModel(Hash)
    while not HasModelLoaded(Hash) do
        Wait(0)
    end
    
    SetPlayerModel(PlayerId(), Model)
end

Module.rotateCoord = function(origin, point, theta)  
    local p = point - origin
    local pX, pY = p.x, p.y
    theta = math.rad(theta)
    local cosTheta = math.cos(theta)
    local sinTheta = math.sin(theta)
    local x = pX * cosTheta - pY * sinTheta
    local y = pX * sinTheta + pY * cosTheta
    return vector3(x, y, 0.0) + origin
end

Module.wallPointToPoint = function(coord1, coord2, height, r, g, b, a)
    DrawPoly(
        coord1.x, coord1.y, coord1.z,
        coord1.x, coord1.y, coord1.z + (height * 2),
        coord2.x, coord2.y, coord2.z,
        r, g, b, a
    )
    DrawPoly(
        coord1.x, coord1.y, coord1.z + (height * 2),
        coord2.x, coord2.y, coord2.z + (height * 2),
        coord2.x, coord2.y, coord2.z,
        r, g, b, a
    )
    DrawPoly(
        coord2.x, coord2.y, coord2.z,
        coord2.x, coord2.y, coord2.z + (height * 2),
        coord1.x, coord1.y, coord1.z + (height * 2),
        r, g, b, a
    )
    DrawPoly(
        coord2.x, coord2.y, coord2.z,
        coord1.x, coord1.y, coord1.z + (height * 2),
        coord1.x, coord1.y, coord1.z,
        r, g, b, a
    )
end

Module.playAnim = function(ped, animDict, animName, blendInSpeed, blendOutSpeed, duration, flag, playbackRate, lockX, lockY, lockZ)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Wait(0)
    end

    TaskPlayAnim(ped, animDict, animName, blendInSpeed, blendOutSpeed, duration, flag, playbackRate, lockX, lockY, lockZ)
end


Module.playAdvancedAnim = function(ped, animDict, animName, posX, posY, posZ, rotX, rotY, rotZ, animEnterSpeed, animExitSpeed, duration, flag, animTime, p14, p15)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Wait(0)
    end

    TaskPlayAnimAdvanced(ped, animDict, animName, posX, posY, posZ, rotX, rotY, rotZ, animEnterSpeed, animExitSpeed, duration, flag, animTime, p14, p15)
end

Module.Test = function()
    return "Utils.Test"
end