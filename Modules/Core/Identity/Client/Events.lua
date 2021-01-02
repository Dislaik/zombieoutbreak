LoadModuleTranslations("Data/Locales/".. GlobalConfig.Lang ..".lua")
local Config = LoadModuleConfig("Data/Config.lua")
local Camera

RegisterNetEvent("Identity:Register")
AddEventHandler("Identity:Register", function()
    DoScreenFadeIn(1000)
    Camera = Utils.CreateCamera(-20.0, 0.0, 230.0)
    SetCamCoord(Camera, 412.4021, -964.2137, 38.4747);
    DisplayRadar(false)
    SetNuiFocus(true, true)
    SendNUIMessage({
        Type = "Identity",
        Locale = GlobalConfig.Lang,
        Display = true,
        Occupation = Config.Occupations
    })
end)

RegisterNetEvent("Identity:Delete")
AddEventHandler("Identity:Delete", function()
    SetEntityCoords(PlayerPedId(), Config.FirstSpawn.X, Config.FirstSpawn.Y, Config.FirstSpawn.Z, false, false, false, true)
    SetEntityHeading(PlayerPedId(), Config.FirstSpawn.Heading)
    TriggerEvent("Identity:Register")
end)


RegisterNUICallback("Identity:Submit", function(Data)
    
    --DisplayRadar(true)
    SetNuiFocus(false, false)
    SendNUIMessage({
        Type = "Identity",
        Display = false
    })
    DoScreenFadeOut(1000)
    Wait(1000)
    Utils.DeleteCamera(Camera)
    DoScreenFadeIn(1000)

    if (Data["Sex"] == "Male") then
        Skin.SetPlayerModel("mp_m_freemode_01")
    else
        Skin.SetPlayerModel("mp_f_freemode_01")
    end

    TriggerServerEvent("Identity:CreateIdentity", Data)
    Skin.SetPlayerDefaultComponents(Data["Sex"])
    TriggerEvent("Skin:Creator")
    Player.Loaded = true
    Skin.HatOn = false
    Skin.TshirtOn = false
    Skin.Gloves = false
    Skin.Pants = false
    Skin.ShoesOn = false
end)


RegisterNetEvent("Identity:SetOccupationClothes")
AddEventHandler("Identity:SetOccupationClothes", function(Item, Sex)
    if Root.UsableClothes[Item][Sex] then
        Root.UsableClothes[Item][Sex]()
    end
end)