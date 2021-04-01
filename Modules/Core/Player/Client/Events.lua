local Utils = M('Utils')
local Skin = M("Skin")

local camera, playerPedPreview, interval

RegisterEvent("Player:Register", function(firstConnection)
    DoScreenFadeIn(1000)
    camera = Utils.createCamera(-20.0, 0.0, 230.0)
    SetCamCoord(camera, Module.Config.FirstSpawn.X, Module.Config.FirstSpawn.Y, Module.Config.FirstSpawn.Z)
    FreezeEntityPosition(PlayerPedId(), true)
    SetEntityInvincible(PlayerPedId(), true)
    SetEntityVisible(PlayerPedId(), false, false)
    SetNuiFocus(true, true)
    print("Paso")
    SendNUIMessage({
        Type = "Player",
        Display = true,
        Locale = Module.Translations,
        Points = Module.playerPoints,
        Occupations = Module.Occupations,
        Traits = Module.Traits,
        MessageDev = firstConnection
    })
end)

RegisterNUICallback("Player:Next", function(data)
    local gameplayCamCoords = GetGameplayCamCoord()

    RequestModel(GetHashKey(data.model))
    while not HasModelLoaded(GetHashKey(data.model)) do
        Citizen.Wait(0)
    end
    --RequestMenuPedModel(GetHashKey(data.model))
    
    SetFrontendActive(true)
    ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_EMPTY"), true, -1)

    interval = SetInterval(10, function()
        N_0x98215325a695e78a(false)
    end)

    playerPedPreview = CreatePed(25, GetHashKey(data.model), gameplayCamCoords.x, gameplayCamCoords.y, gameplayCamCoords.z, 0.0, false, false)

    FreezeEntityPosition(playerPedPreview, true)
    N_0x4668d80430d6c299(playerPedPreview)
    Wait(100)
    GivePedToPauseMenu(playerPedPreview, 2)

    SetPauseMenuPedLighting(true)
    SetPauseMenuPedSleepState(true)
end)

RegisterNUICallback("Player:Back", function()
    SetFrontendActive(false)
end)

RegisterNUICallback("Player:UpdateModel", function(data)
    local gameplayCamCoords = GetGameplayCamCoord()

    if GetEntityModel(playerPedPreview) ~= GetHashKey(data.model) then
        DeleteEntity(playerPedPreview)
        --Skin.SetPlayerPed(data.Model)
        --Skin.SetPlayerDefaultComponents(Skin.GetPlayerSex(PlayerPedId()))

        RequestModel(GetHashKey(data.model))
        while not HasModelLoaded(GetHashKey(data.model)) do
            Wait(0)
        end

        --RequestMenuPedModel(GetHashKey(data.Model))

        playerPedPreview = CreatePed(25, GetHashKey(data.model), gameplayCamCoords.x, gameplayCamCoords.y, gameplayCamCoords.z, 0.0, false, false)
        --Skin.SetPlayerDefaultComponents(Skin.GetPlayerSex(playerPedPreview))
        FreezeEntityPosition(playerPedPreview, true)
        N_0x4668d80430d6c299(playerPedPreview)
        Wait(100)
        GivePedToPauseMenu(playerPedPreview, 2)
    end

end)

RegisterNUICallback("Player:UpdateAppearance", function(data)
    --------------------- Appearance ---------------------
    SetPedHeadBlendData(playerPedPreview, data.face, 0, 0, data.skin, 0, 0, 0, 0, 0, false)
    SetPedComponentVariation(playerPedPreview, 2, data.hair, 0, 0)
    SetPedHairColor(playerPedPreview, data.haircolor, 0)
    SetPedEyeColor(playerPedPreview, data.eyes)
    SetPedHeadOverlay(playerPedPreview, 2, data.eyebrows, 1.0)
    if (data.beards == -1) then SetPedHeadOverlay(playerPedPreview, 1, 0, 0.0)
    else SetPedHeadOverlay(playerPedPreview, 1, data.beards, 1.0) end
    if (data.chest == -1) then SetPedHeadOverlay(playerPedPreview, 10, 0, 0.0)
    else SetPedHeadOverlay(playerPedPreview, 10, data.chest, 1.0) end
    SetPedHeadOverlayColor(playerPedPreview, 1, 1, data.haircolor, 0)
    SetPedHeadOverlayColor(playerPedPreview, 2, 1, data.haircolor, 0)
    SetPedHeadOverlayColor(playerPedPreview, 10, 1, data.haircolor, 0)
    --------------------- Clothing ---------------------
    if (data.hat == -1) then ClearPedProp(playerPedPreview, 0)
    else SetPedPropIndex(playerPedPreview, 0, data.hat, 0, true) end
    if (data.glasses == -1) then ClearPedProp(playerPedPreview, 1)
    else SetPedPropIndex(playerPedPreview, 1, data.glasses, 0, true) end
    if (data.top == -1) then Skin.DeleteClothes(playerPedPreview, 7)
    else Skin.SetClothes(playerPedPreview, 7, data.top, 0, 0) end
    if (data.pants == -1) then Skin.DeleteClothes(playerPedPreview, 11)
    else Skin.SetClothes(playerPedPreview, 11, data.pants, 0, 0) end
    if (data.shoes == -1) then Skin.DeleteClothes(playerPedPreview, 12)
    else Skin.SetClothes(playerPedPreview, 12, data.shoes, 0, 0) end
end)

RegisterNUICallback("Player:Play", function(data)
    local playerSpawn = Module.Config.PlayerSpawn[Utils.random(1, #Module.Config.PlayerSpawn)]
    local skinDictionary = {
        skin = data.skin,
        face = data.face,
        hair = data.hair,
        haircolor = data.haircolor,
        eyes = data.eyes,
        eyebrows = data.eyebrows,
        beard = data.beard,
        chest = data.chest
    }

    TriggerServerEvent("Player:SetDataCharacter", data)
    DoScreenFadeOut(1000)
    Wait(1000)
    SetFrontendActive(false)
    ClearInterval(interval)
    SetNuiFocus(false, false)

    SendNUIMessage({
        Type = "Player",
        Display = false
    })
    
    SetEntityCoords(PlayerPedId(),  playerSpawn.x, playerSpawn.y, playerSpawn.z, false, false, false, false)
    Utils.setPlayerModel(data.model)
    TriggerServerEvent("Skin:SetPlayerSkin", skinDictionary)
    Skin.SetPlayerComponents(Skin.GetPlayerSex(PlayerPedId()), skinDictionary)
    FreezeEntityPosition(PlayerPedId(), false)
    SetEntityInvincible(PlayerPedId(), false)
    SetEntityVisible(PlayerPedId(), true, true)
    Utils.deleteCamera(camera)

    Wait(3000)
    
    DoScreenFadeIn(1000)

    TriggerServerEvent("Status:InitStatus")

    Module:getPlayer():loaded(true)

end)

RegisterEvent("Player:LoadPlayer", function(gender, status, skin, position)
    local player = Module:getPlayer()

    if gender == "Male" then
        Utils.setPlayerModel("mp_m_freemode_01")
    else
        Utils.setPlayerModel("mp_f_freemode_01")
    end

    if gender == "Male" then
        SetPedHeadBlendData(PlayerPedId(), skin.face, 0, 0, skin.skin, 0, 0, 0, 0, 0, false)
        SetPedComponentVariation(PlayerPedId(), 2, skin.hair, 0, 0)
        SetPedHairColor(PlayerPedId(), skin.haircolor, 0)
        SetPedEyeColor(PlayerPedId(), skin.eyes)
        --SetPedHeadOverlay(PlayerPedId(), 0, skin["Blemishes"], skin["BlemishesOpacity"])
        if skin.beard == -1 then SetPedHeadOverlay(PlayerPedId(), 1, 0, 0.0)
        else SetPedHeadOverlay(PlayerPedId(), 1, skin.beards, 1.0) end
        if skin.chest == -1 then SetPedHeadOverlay(PlayerPedId(), 10, 0, 0.0)
        else SetPedHeadOverlay(PlayerPedId(), 10, skin.chest, 1.0) end
        SetPedHeadOverlayColor(PlayerPedId(), 1, 1, skin.hairColor, 0)
        SetPedHeadOverlayColor(PlayerPedId(), 2, 1, skin.hairColor, 0)
        SetPedHeadOverlayColor(PlayerPedId(), 10, 1, skin.hairColor, 0)
        --SetPedHeadOverlay(PlayerPedId(), 2, skin["Eyebrows"], skin["EyebrowsOpacity"])
        --SetPedHeadOverlay(PlayerPedId(), 3, skin["Wrinkles"], skin["WrinklesOpacity"])
        --SetPedHeadOverlay(PlayerPedId(), 4, skin["Makeup"], skin["MakeupOpacity"])
        --SetPedHeadOverlayColor(PlayerPedId(), 4, 1, skin["MakeupColor"], 0)
        --SetPedHeadOverlay(PlayerPedId(), 5, skin["Blush"], skin["BlushOpacity"])
        --SetPedHeadOverlayColor(PlayerPedId(), 5, 1, skin["BlushColor"], 0)
        --SetPedHeadOverlay(PlayerPedId(), 6, skin["Complexion"], skin["ComplexionOpacity"])
        --SetPedHeadOverlay(PlayerPedId(), 7, skin["SunDamage"], skin["SunDamageOpacity"])
        --SetPedHeadOverlay(PlayerPedId(), 8, skin["Lipstick"], skin["LipstickOpacity"])
        --SetPedHeadOverlayColor(PlayerPedId(), 8, 1, skin["LipstickColor"], 0)
        --SetPedHeadOverlay(PlayerPedId(), 9, skin["Freckles"], skin["FrecklesOpacity"])
        --SetPedHeadOverlay(PlayerPedId(), 11, skin["BodyBlemishes"], skin["BodyBlemishesOpacity"])
        if skin.Hat then
            Skin.SetClothes(gender, 0, skin.Hat)
        else
            Skin.DeleteClothes(PlayerPedId(), 0)
        end
        if skin.Glasses then
            Skin.SetClothes(gender, 1, skin.Glasses)
        else
            Skin.DeleteClothes(PlayerPedId(), 1)
        end
        if skin.Earrings then
            Skin.SetClothes(gender, 2, skin.Earrings)
        else
            Skin.DeleteClothes(PlayerPedId(), 2)
        end
        if skin.Watch then
            Skin.SetClothes(gender, 3, skin.Watch)
        else
            Skin.DeleteClothes(PlayerPedId(), 3)
        end
        if skin.Bracelet then
            Skin.SetClothes(gender, 4, skin.Bracelet)
        else
            Skin.DeleteClothes(PlayerPedId(), 4)
        end
        if skin.Mask then
            Skin.SetClothes(gender, 5, skin.Mask)
        else
            Skin.DeleteClothes(PlayerPedId(), 5)
        end
        if skin.Accessory then
            Skin.SetClothes(gender, 6, skin.Accessory)
        else
            Skin.DeleteClothes(PlayerPedId(), 6)
        end
        if skin.Tshirt then 
            Skin.SetClothes(gender, 7, skin.Tshirt)
        else 
            Skin.DeleteClothes(PlayerPedId(), 7)
        end
        if skin.Gloves then 
            Skin.SetClothes(gender, 8, skin.Gloves)
        else 
            Skin.DeleteClothes(PlayerPedId(), 8)
        end
        if skin.Armor then 
            Skin.SetClothes(gender, 9, skin.Armor)
        else 
            Skin.DeleteClothes(PlayerPedId(), 9)
        end
        if skin.Bag then 
            Skin.SetClothes(gender, 10, skin.Bag)
        else 
            Skin.DeleteClothes(PlayerPedId(), 10)
        end
        if skin.Pants then
            Skin.SetClothes(gender, 11, skin.Pants)
        else
            Skin.DeleteClothes(PlayerPedId(), 11)
        end
        if skin.Shoes then
            Skin.SetClothes(gender, 12, skin.Shoes)
        else
            Skin.DeleteClothes(PlayerPedId(), 12)
        end
    elseif gender == "Female" then
        SetPedHeadBlendData(PlayerPedId(), skin.face, 0, 0, skin.skin, 0, 0, 0, 0, 0, false)
        SetPedComponentVariation(PlayerPedId(), 2, skin.hair, 0, 0)
        SetPedHairColor(PlayerPedId(), skin.haircolor, 0)
        SetPedEyeColor(PlayerPedId(), skin.eyes)
        --SetPedHeadOverlay(PlayerPedId(), 0, skin["Blemishes"], skin["BlemishesOpacity"])
        if skin.beard == -1 then SetPedHeadOverlay(PlayerPedId(), 1, 0, 0.0)
        else SetPedHeadOverlay(PlayerPedId(), 1, skin.beards, 1.0) end
        if skin.chest == -1 then SetPedHeadOverlay(PlayerPedId(), 10, 0, 0.0)
        else SetPedHeadOverlay(PlayerPedId(), 10, skin.chest, 1.0) end
        SetPedHeadOverlayColor(PlayerPedId(), 1, 1, skin.hair_color, 0)
        SetPedHeadOverlayColor(PlayerPedId(), 2, 1, skin.hair_color, 0)
        SetPedHeadOverlayColor(PlayerPedId(), 10, 1, skin.hair_color, 0)
        --SetPedHeadOverlay(PlayerPedId(), 2, skin["Eyebrows"], skin["EyebrowsOpacity"])
        --SetPedHeadOverlay(PlayerPedId(), 3, skin["Wrinkles"], skin["WrinklesOpacity"])
        --SetPedHeadOverlay(PlayerPedId(), 4, skin["Makeup"], skin["MakeupOpacity"])
        --SetPedHeadOverlayColor(PlayerPedId(), 4, 1, skin["MakeupColor"], 0)
        --SetPedHeadOverlay(PlayerPedId(), 5, skin["Blush"], skin["BlushOpacity"])
        --SetPedHeadOverlayColor(PlayerPedId(), 5, 1, skin["BlushColor"], 0)
        --SetPedHeadOverlay(PlayerPedId(), 6, skin["Complexion"], skin["ComplexionOpacity"])
        --SetPedHeadOverlay(PlayerPedId(), 7, skin["SunDamage"], skin["SunDamageOpacity"])
        --SetPedHeadOverlay(PlayerPedId(), 8, skin["Lipstick"], skin["LipstickOpacity"])
        --SetPedHeadOverlayColor(PlayerPedId(), 8, 1, skin["LipstickColor"], 0)
        --SetPedHeadOverlay(PlayerPedId(), 9, skin["Freckles"], skin["FrecklesOpacity"])
        --SetPedHeadOverlay(PlayerPedId(), 11, skin["BodyBlemishes"], skin["BodyBlemishesOpacity"])
        if skin.Hat then
            Skin.SetClothes(gender, 0, skin.Hat)
        else
            Skin.DeleteClothes(PlayerPedId(), 0)
        end
        if skin.Glasses then
            Skin.SetClothes(gender, 1, skin.Glasses)
        else
            Skin.DeleteClothes(PlayerPedId(), 1)
        end
        if skin.Earrings then
            Skin.SetClothes(gender, 2, skin.Earrings)
        else
            Skin.DeleteClothes(PlayerPedId(), 2)
        end
        if skin.Watch then
            Skin.SetClothes(gender, 3, skin.Watch)
        else
            Skin.DeleteClothes(PlayerPedId(), 3)
        end
        if skin.Bracelet then
            Skin.SetClothes(gender, 4, skin.Bracelet)
        else
            Skin.DeleteClothes(PlayerPedId(), 4)
        end
        if skin.Mask then
            Skin.SetClothes(gender, 5, skin.Mask)
        else
            Skin.DeleteClothes(PlayerPedId(), 5)
        end
        if skin.Accessory then
            Skin.SetClothes(gender, 6, skin.Accessory)
        else
            Skin.DeleteClothes(PlayerPedId(), 6)
        end
        if skin.Tshirt then 
            Skin.SetClothes(gender, 7, skin.Tshirt)
        else 
            Skin.DeleteClothes(PlayerPedId(), 7)
        end
        if skin.Gloves then 
            Skin.SetClothes(gender, 8, skin.Gloves)
        else 
            Skin.DeleteClothes(PlayerPedId(), 8)
        end
        if skin.Armor then 
            Skin.SetClothes(gender, 9, skin.Armor)
        else 
            Skin.DeleteClothes(PlayerPedId(), 9)
        end
        if skin.Bag then 
            Skin.SetClothes(gender, 10, skin.Bag)
        else 
            Skin.DeleteClothes(PlayerPedId(), 10)
        end
        if skin.Pants then
            Skin.SetClothes(gender, 11, skin.Pants)
        else
            Skin.DeleteClothes(PlayerPedId(), 11)
        end
        if skin.Shoes then
            Skin.SetClothes(gender, 12, skin.Shoes)
        else
            Skin.DeleteClothes(PlayerPedId(), 12)
        end
    end

    SetEntityCoords(PlayerPedId(), position, false, false, false, true)

    print("PLAYER LOADED")
    Wait(1000)
    DoScreenFadeIn(1000)
    
    player:loaded(true)
    player:setStatus(status)
end)
--]]
RegisterNetEvent("Player:ShowNotification")
AddEventHandler("Player:ShowNotification", function(message)
    Module.ShowNotification(message)
end)
--[[
RegisterNetEvent("Player:DeathDetection")
AddEventHandler("Player:DeathDetection", function(Data)
    AnimpostfxPlay("DeathFailOut", 0, true)
    PlaySoundFrontend(-1, "Bed", "WastedSounds", true)
end)--]]

RegisterEvent("Player:LoadedInstance", function()
    if not Module.Loaded() then
        print("Instance separated")
        Module.SeparateInstance(true)
    end
end)