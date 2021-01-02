local Camera, CameraView = nil, false

RegisterNetEvent("Skin:Creator")
AddEventHandler("Skin:Creator", function(Data)
    Camera = Utils.CreateCamera(0.0, 0.0, 180.0)
    local PlayerCoords = GetEntityCoords(PlayerPedId(), true)
    SetEntityHeading(PlayerPedId(), -20.0)
    SetCamCoord(Camera, PlayerCoords.x + 0.2, PlayerCoords.y + 0.5, PlayerCoords.z + 0.6)
    DisplayRadar(false)
    SetNuiFocus(true, true)
    SendNUIMessage({
        Type = "Skin",
        Sex = Skin.GetPlayerSex(),
        Locale = GlobalConfig.Lang,
        Display = true
    })
end)

RegisterNUICallback("Skin:RotateLeft", function(Data)
    local Rotation = Data["Left"]
    local PlayerHeading = GetEntityHeading(PlayerPedId())
    SetEntityHeading(PlayerPedId(), (PlayerHeading + Rotation))
end)

RegisterNUICallback("Skin:RotateRight", function(Data)
    local Rotation = Data["Right"]
    local PlayerHeading = GetEntityHeading(PlayerPedId())
    SetEntityHeading(PlayerPedId(), (PlayerHeading - Rotation))
end)

RegisterNUICallback("Skin:View", function(Data)
    local PlayerCoords = GetEntityCoords(PlayerPedId(), true)
    if (CameraView) then
        SetCamCoord(Camera, PlayerCoords.x + 0.2, PlayerCoords.y + 0.5, PlayerCoords.z + 0.6)
        CameraView = false
    else
        SetCamCoord(Camera, PlayerCoords.x + 0.3, PlayerCoords.y + 2.0, PlayerCoords.z)
        CameraView = true
    end
end)

RegisterNUICallback("Skin:Submit", function(Data)
    local Dictionary
    DisplayRadar(true)
    SetNuiFocus(false, false)
    SendNUIMessage({
        Type = "Skin",
        Sex = Skin.GetPlayerSex(),
        Display = false
    })
    DoScreenFadeOut(1000)
    TriggerServerEvent("Skin:SetPlayerSkin", Data)
    TriggerServerEvent("Identity:OccupationSuit", Skin.GetPlayerSex())
    Wait(1000)
    Utils.DeleteCamera(Camera)
    DoScreenFadeIn(1000)
end)

RegisterNUICallback("Skin:Update", function(Data)
    SetPedHeadBlendData(PlayerPedId(), Data["Face"], 0, 0, Data["Skin"], 0, 0, 0, 0, 0, false)
    SetPedComponentVariation(PlayerPedId(), 2, Data["Hair"], 0, 0)
    SetPedHairColor(PlayerPedId(), Data["HairColor"], 0)
    SetPedEyeColor(PlayerPedId(), Data["EyesColor"])
    SetPedHeadOverlay(PlayerPedId(), 0, Data["Blemishes"], Data["BlemishesOpacity"])
    SetPedHeadOverlay(PlayerPedId(), 1, Data["Beard"], Data["BeardOpacity"])
    SetPedHeadOverlayColor(PlayerPedId(), 1, 1, Data["BeardColor"], 0)
    SetPedHeadOverlay(PlayerPedId(), 2, Data["Eyebrows"], Data["EyebrowsOpacity"])
    SetPedHeadOverlayColor(PlayerPedId(), 2, 1, Data["EyebrowsColor"], 0)
    SetPedHeadOverlay(PlayerPedId(), 3, Data["Wrinkles"], Data["WrinklesOpacity"])
    SetPedHeadOverlay(PlayerPedId(), 4, Data["Makeup"], Data["MakeupOpacity"])
    SetPedHeadOverlayColor(PlayerPedId(), 4, 1, Data["MakeupColor"], 0)
    SetPedHeadOverlay(PlayerPedId(), 5, Data["Blush"], Data["BlushOpacity"])
    SetPedHeadOverlayColor(PlayerPedId(), 5, 1, Data["BlushColor"], 0)
    SetPedHeadOverlay(PlayerPedId(), 6, Data["Complexion"], Data["ComplexionOpacity"])
    SetPedHeadOverlay(PlayerPedId(), 7, Data["SunDamage"], Data["SunDamageOpacity"])
    SetPedHeadOverlay(PlayerPedId(), 8, Data["Lipstick"], Data["LipstickOpacity"])
    SetPedHeadOverlayColor(PlayerPedId(), 8, 1, Data["LipstickColor"], 0)
    SetPedHeadOverlay(PlayerPedId(), 9, Data["Freckles"], Data["FrecklesOpacity"])
    SetPedHeadOverlay(PlayerPedId(), 10, Data["ChestHair"], Data["ChestHairOpacity"])
    SetPedHeadOverlayColor(PlayerPedId(), 10, 1, Data["ChestHairColor"], 0)
    SetPedHeadOverlay(PlayerPedId(), 11, Data["BodyBlemishes"], Data["BodyBlemishesOpacity"])
end)

RegisterNetEvent("Skin:RemoveClothes")
AddEventHandler("Skin:RemoveClothes", function(Name, Sex)
    for i in pairs(Root.ItemClothes) do
        if i == Name then
            local Component = Root.ItemClothes[i][Sex][1]
            local DrawableId = Root.ItemClothes[i][Sex][2]
                
            if Component == 0 then
                if DrawableId == GetPedPropIndex(PlayerPedId(), 0) then
                    Skin.DeleteClothes(Component)
                end
            elseif Component == 1 then
                if DrawableId == GetPedPropIndex(PlayerPedId(), 1) then
                    Skin.DeleteClothes(Component)
                end
            elseif Component == 2 then
                if DrawableId == GetPedPropIndex(PlayerPedId(), 2) then
                    Skin.DeleteClothes(Component)
                end
            elseif Component == 3 then
                if DrawableId == GetPedPropIndex(PlayerPedId(), 6) then
                    Skin.DeleteClothes(Component)
                end
            elseif Component == 4 then
                if DrawableId == GetPedPropIndex(PlayerPedId(), 7) then
                    Skin.DeleteClothes(Component)
                end
            elseif Component == 5 then
                if DrawableId == GetPedDrawableVariation(PlayerPedId(), 1) then
                    Skin.DeleteClothes(Component)
                end
            elseif Component == 6 then
                if DrawableId == GetPedDrawableVariation(PlayerPedId(), 7) then
                    Skin.DeleteClothes(Component)
                end
            elseif Component == 7 then
                if DrawableId == GetPedDrawableVariation(PlayerPedId(), 11) then
                    Skin.DeleteClothes(Component)
                end
            elseif Component == 8 then
                if DrawableId == GetPedDrawableVariation(PlayerPedId(), 3) then
                    Skin.DeleteClothes(Component)
                end
            elseif Component == 9 then
                if DrawableId == GetPedDrawableVariation(PlayerPedId(), 9) then
                    Skin.DeleteClothes(Component)
                end
            elseif Component == 10 then
                if DrawableId == GetPedDrawableVariation(PlayerPedId(), 5) then
                    Skin.DeleteClothes(Component)
                end
            elseif Component == 11 then
                if DrawableId == GetPedDrawableVariation(PlayerPedId(), 4) then
                    Skin.DeleteClothes(Component)
                end
            elseif Component == 12 then
                if DrawableId == GetPedDrawableVariation(PlayerPedId(), 6) then
                    Skin.DeleteClothes(Component)
                end
            end
        end
    end
end)