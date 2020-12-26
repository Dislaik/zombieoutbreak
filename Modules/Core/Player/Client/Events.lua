RegisterNetEvent("Player:LoadPlayer")
AddEventHandler("Player:LoadPlayer", function(Sex, PlayerSkin, Position)
    local Model
    if Sex == "Male" then
        Model = "mp_m_freemode_01"
    else
        Model = "mp_f_freemode_01"
    end

    local Hash = GetHashKey(Model)
    RequestModel(Hash)
    while not HasModelLoaded(Hash) do
        Wait(0)
    end

    SetPlayerModel(PlayerId(), Model)

    if Sex == "Male" then
        SetPedHeadBlendData(PlayerPedId(), PlayerSkin["Face"], 0, 0, PlayerSkin["Skin"], 0, 0, 0, 0, 0, false)
        SetPedComponentVariation(PlayerPedId(), 2, PlayerSkin["Hair"], 0, 0)
        SetPedHairColor(PlayerPedId(), PlayerSkin["HairColor"], 0)
        SetPedEyeColor(PlayerPedId(), PlayerSkin["EyesColor"])
        SetPedHeadOverlay(PlayerPedId(), 0, PlayerSkin["Blemishes"], PlayerSkin["BlemishesOpacity"])
        SetPedHeadOverlay(PlayerPedId(), 1, PlayerSkin["Beard"], PlayerSkin["BeardOpacity"])
        SetPedHeadOverlayColor(PlayerPedId(), 1, 1, PlayerSkin["BeardColor"], 0)
        SetPedHeadOverlay(PlayerPedId(), 2, PlayerSkin["Eyebrows"], PlayerSkin["EyebrowsOpacity"])
        SetPedHeadOverlayColor(PlayerPedId(), 2, 1, PlayerSkin["EyebrowsColor"], 0)
        SetPedHeadOverlay(PlayerPedId(), 3, PlayerSkin["Wrinkles"], PlayerSkin["WrinklesOpacity"])
        SetPedHeadOverlay(PlayerPedId(), 4, PlayerSkin["Makeup"], PlayerSkin["MakeupOpacity"])
        SetPedHeadOverlayColor(PlayerPedId(), 4, 1, PlayerSkin["MakeupColor"], 0)
        SetPedHeadOverlay(PlayerPedId(), 5, PlayerSkin["Blush"], PlayerSkin["BlushOpacity"])
        SetPedHeadOverlayColor(PlayerPedId(), 5, 1, PlayerSkin["BlushColor"], 0)
        SetPedHeadOverlay(PlayerPedId(), 6, PlayerSkin["Complexion"], PlayerSkin["ComplexionOpacity"])
        SetPedHeadOverlay(PlayerPedId(), 7, PlayerSkin["SunDamage"], PlayerSkin["SunDamageOpacity"])
        SetPedHeadOverlay(PlayerPedId(), 8, PlayerSkin["Lipstick"], PlayerSkin["LipstickOpacity"])
        SetPedHeadOverlayColor(PlayerPedId(), 8, 1, PlayerSkin["LipstickColor"], 0)
        SetPedHeadOverlay(PlayerPedId(), 9, PlayerSkin["Freckles"], PlayerSkin["FrecklesOpacity"])
        SetPedHeadOverlay(PlayerPedId(), 10, PlayerSkin["ChestHair"], PlayerSkin["ChestHairOpacity"])
        SetPedHeadOverlayColor(PlayerPedId(), 10, 1, PlayerSkin["ChestHairColor"], 0)
        SetPedHeadOverlay(PlayerPedId(), 11, PlayerSkin["BodyBlemishes"], PlayerSkin["BodyBlemishesOpacity"])
        if PlayerSkin["Hat"] then
            Skin.SetClothes(Sex, 0, PlayerSkin["Hat"])
        else
            Skin.DeleteClothes(0)
        end
        if PlayerSkin["Tshirt"] then 
            Skin.SetClothes(Sex, 1, PlayerSkin["Tshirt"])
        else 
            Skin.DeleteClothes(1)
        end
        if PlayerSkin["Pants"] then
            Skin.SetClothes(Sex, 3, PlayerSkin["Pants"])
        else
            Skin.DeleteClothes(3)
        end
        if PlayerSkin["Shoes"] then
            Skin.SetClothes(Sex, 4, PlayerSkin["Shoes"])
        else
            Skin.DeleteClothes(4)
        end
    elseif Sex == "Female" then
        SetPedHeadBlendData(PlayerPedId(), PlayerSkin["Face"], 0, 0, PlayerSkin["Skin"], 0, 0, 0, 0, 0, false)
        SetPedComponentVariation(PlayerPedId(), 2, PlayerSkin["Hair"], 0, 0)
        SetPedHairColor(PlayerPedId(), PlayerSkin["HairColor"], 0)
        SetPedEyeColor(PlayerPedId(), PlayerSkin["EyesColor"])
        SetPedHeadOverlay(PlayerPedId(), 0, PlayerSkin["Blemishes"], PlayerSkin["BlemishesOpacity"])
        SetPedHeadOverlay(PlayerPedId(), 1, 0, 0.0)
        SetPedHeadOverlayColor(PlayerPedId(), 1, 1, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 2, PlayerSkin["Eyebrows"], PlayerSkin["EyebrowsOpacity"])
        SetPedHeadOverlayColor(PlayerPedId(), 2, 1, PlayerSkin["EyebrowsColor"], 0)
        SetPedHeadOverlay(PlayerPedId(), 3, PlayerSkin["Wrinkles"], PlayerSkin["WrinklesOpacity"])
        SetPedHeadOverlay(PlayerPedId(), 4, PlayerSkin["Makeup"], PlayerSkin["MakeupOpacity"])
        SetPedHeadOverlayColor(PlayerPedId(), 4, 1, PlayerSkin["MakeupColor"], 0)
        SetPedHeadOverlay(PlayerPedId(), 5, PlayerSkin["Blush"], PlayerSkin["BlushOpacity"])
        SetPedHeadOverlayColor(PlayerPedId(), 5, 1, PlayerSkin["BlushColor"], 0)
        SetPedHeadOverlay(PlayerPedId(), 6, PlayerSkin["Complexion"], PlayerSkin["ComplexionOpacity"])
        SetPedHeadOverlay(PlayerPedId(), 7, PlayerSkin["SunDamage"], PlayerSkin["SunDamageOpacity"])
        SetPedHeadOverlay(PlayerPedId(), 8, PlayerSkin["Lipstick"], PlayerSkin["LipstickOpacity"])
        SetPedHeadOverlayColor(PlayerPedId(), 8, 1, PlayerSkin["LipstickColor"], 0)
        SetPedHeadOverlay(PlayerPedId(), 9, PlayerSkin["Freckles"], PlayerSkin["FrecklesOpacity"])
        SetPedHeadOverlay(PlayerPedId(), 10, 0, 0.0)
        SetPedHeadOverlayColor(PlayerPedId(), 10, 1, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 11, PlayerSkin["BodyBlemishes"], PlayerSkin["BodyBlemishesOpacity"])
        if PlayerSkin["Hat"] then
            Skin.SetClothes(Sex, 0, PlayerSkin["Hat"])
        else
            Skin.DeleteClothes(0)
        end
        if PlayerSkin["Tshirt"] then 
            Skin.SetClothes(Sex, 1, PlayerSkin["Tshirt"])
        else 
            Skin.DeleteClothes(1)
        end
        if PlayerSkin["Pants"] then
            Skin.SetClothes(Sex, 3, PlayerSkin["Pants"])
        else
            Skin.DeleteClothes(3)
        end
        if PlayerSkin["Shoes"] then
            Skin.SetClothes(Sex, 4, PlayerSkin["Shoes"])
        else
            Skin.DeleteClothes(4)
        end
    end

    SetEntityCoords(PlayerPedId(), Position.x, Position.y, Position.z, false, false, false, true)

    Player.Loaded = true
    DoScreenFadeIn(1000)

end)

RegisterNetEvent("Player:ShowNotification")
AddEventHandler("Player:ShowNotification", function(Message)
    Player.ShowNotification(Message)
end)

RegisterNetEvent("Player:DeathDetection")
AddEventHandler("Player:DeathDetection", function(Data)
    AnimpostfxPlay("DeathFailOut", 0, true)
    PlaySoundFrontend(-1, "Bed", "WastedSounds", true)
end)