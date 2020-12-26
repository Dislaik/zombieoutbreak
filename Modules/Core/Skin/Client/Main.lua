Load("Client/Events.lua")


Skin = {}

Skin.HatOn = false
Skin.TshirtOn = false
Skin.GlovesOn = false
Skin.PantsOn = false
Skin.ShoesOn = false
Skin.ActiveClothes = {}

Skin.SetPlayerModel = function(Model)
    local Hash = GetHashKey(Model)
    RequestModel(Hash)
    while not HasModelLoaded(Hash) do
        Wait(0)
    end

    SetPlayerModel(PlayerId(), Model)
end

Skin.SetPlayerDefaultComponents = function(Sex)
    if (Sex == "Male") then
        SetPedHeadBlendData(PlayerPedId(), 0, 0, 0, 0, 0, 0, 0, 0, 0, false)
        SetPedComponentVariation(PlayerPedId(), 2, 0, 0, 0)
        SetPedHairColor(PlayerPedId(), 0, 0)
        SetPedEyeColor(PlayerPedId(), 0)
        SetPedHeadOverlay(PlayerPedId(), 0, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 1, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 2, 0, 1)
        SetPedHeadOverlayColor(PlayerPedId(), 1, 1, 0, 0)
        SetPedHeadOverlayColor(PlayerPedId(), 2, 1, 0, 0)
        SetPedHeadOverlayColor(PlayerPedId(), 10, 1, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 3, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 6, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 7, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 9, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 10, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 11, 0, 0)
        SetPedPropIndex(PlayerPedId(), 0, 8, 0, true)
        SetPedComponentVariation(PlayerPedId(), 11, 15, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 8, 15, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 3, 15, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 4, 21, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 6, 34, 0, 0)
    else
        SetPedHeadBlendData(PlayerPedId(), 21, 0, 0, 0, 0, 0, 0, 0, 0, false)
        SetPedComponentVariation(PlayerPedId(), 2, 0, 0, 0)
        SetPedHairColor(PlayerPedId(), 0, 0)
        SetPedEyeColor(PlayerPedId(), 0)
        SetPedHeadOverlay(PlayerPedId(), 0, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 1, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 2, 0, 1)
        SetPedHeadOverlayColor(PlayerPedId(), 1, 1, 0, 0)
        SetPedHeadOverlayColor(PlayerPedId(), 2, 1, 0, 0)
        SetPedHeadOverlayColor(PlayerPedId(), 10, 1, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 3, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 6, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 7, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 9, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 10, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 11, 0, 0)
        SetPedPropIndex(PlayerPedId(), 0, 120, 0, true)
        SetPedComponentVariation(PlayerPedId(), 11, 5, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 8, 14, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 3, 15, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 4, 14, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 6, 35, 0, 0)
    end
end

Skin.GetPlayerSex = function() 
    local Sex
    local Hash = GetEntityModel(PlayerPedId())
    if Hash == GetHashKey("mp_m_freemode_01") then
        Sex = "Male"
    elseif Hash == GetHashKey("mp_f_freemode_01") then
        Sex = "Female"
    end

    return Sex
end

Skin.SetClothes = function(Sex, Clothes, DrawableId, TextureIdl, PaletteId)
    TextureIdl = TextureIdl or 0
    PaletteId = PaletteId or 0
    
    TriggerServerEvent("Skin:SetClothes", Clothes, DrawableId)

    if Clothes == 0 then
        if Sex == "Male" then
            SetPedPropIndex(PlayerPedId(), 0, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedPropIndex(PlayerPedId(), 0, DrawableId, TextureIdl, PaletteId)
        end

        Skin.HatOn = true
    elseif Clothes == 1 then
        if Sex == "Male" then
            SetPedComponentVariation(PlayerPedId(), 11, DrawableId, TextureIdl, PaletteId)

            if DrawableId == 55 then
                SetPedComponentVariation(PlayerPedId(), 8, 15, 0, 0)
                SetPedComponentVariation(PlayerPedId(), 3, 0, 0, 0)
            elseif DrawableId == 56 then
                SetPedComponentVariation(PlayerPedId(), 8, 15, 0, 0)
                SetPedComponentVariation(PlayerPedId(), 3, 0, 0, 0)
            elseif DrawableId == 250 then
                SetPedComponentVariation(PlayerPedId(), 10, 58, 0, 0)
                SetPedComponentVariation(PlayerPedId(), 8, 15, 0, 0)
                SetPedComponentVariation(PlayerPedId(), 3, 0, 0, 0)
            end

        elseif Sex == "Female" then
            SetPedComponentVariation(PlayerPedId(), 11, DrawableId, TextureIdl, PaletteId)

            if DrawableId == 49 then
                SetPedComponentVariation(PlayerPedId(), 8, 14, 0, 0)
                SetPedComponentVariation(PlayerPedId(), 3, 14, 0, 0)
            elseif DrawableId == 48 then
                SetPedComponentVariation(PlayerPedId(), 8, 14, 0, 0)
                SetPedComponentVariation(PlayerPedId(), 3, 14, 0, 0)
            elseif DrawableId == 258 then
                SetPedComponentVariation(PlayerPedId(), 10, 66, 0, 0)
                SetPedComponentVariation(PlayerPedId(), 8, 14, 0, 0)
                SetPedComponentVariation(PlayerPedId(), 3, 14, 0, 0)
            end
        end

        Skin.TshirtOn = true
    elseif Clothes == 2 then
        --Gloves
        Skin.GlovesOn = true
    elseif Clothes == 3 then
        if Sex == "Male" then
            SetPedComponentVariation(PlayerPedId(), 4, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedComponentVariation(PlayerPedId(), 4, DrawableId, TextureIdl, PaletteId)
        end

        Skin.PantsOn = true
    elseif Clothes == 4 then
        if Sex == "Male" then
            SetPedComponentVariation(PlayerPedId(), 6, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedComponentVariation(PlayerPedId(), 6, DrawableId, TextureIdl, PaletteId)
        end
        Skin.ShoesOn = true
    end

end

Skin.DeleteClothes = function(Clothes)
    if Clothes == 0 then
        if Skin.GetPlayerSex() == "Male" then
            SetPedPropIndex(PlayerPedId(), 0, 8, 0, 0)
        elseif Skin.GetPlayerSex() == "Female" then
            SetPedPropIndex(PlayerPedId(), 0, 120, 0, 0)
        end

        Skin.HatOn = false
    elseif Clothes == 1 then
        if Skin.GetPlayerSex() == "Male" then
            SetPedComponentVariation(PlayerPedId(), 10, 0, 0, 0)
            SetPedComponentVariation(PlayerPedId(), 11, 15, 0, 0)
            SetPedComponentVariation(PlayerPedId(), 8, 15, 0, 0)
            SetPedComponentVariation(PlayerPedId(), 3, 15, 0, 0)
        elseif Skin.GetPlayerSex() == "Female" then
            SetPedComponentVariation(PlayerPedId(), 10, 0, 0, 0)
            SetPedComponentVariation(PlayerPedId(), 11, 5, 0, 0)
            SetPedComponentVariation(PlayerPedId(), 8, 14, 0, 0)
            SetPedComponentVariation(PlayerPedId(), 3, 15, 0, 0)
        end

        Skin.TshirtOn = false
    elseif Clothes == 2 then
        --Gloves
        Skin.GlovesOn = false
    elseif Clothes == 3 then
        if Skin.GetPlayerSex() == "Male" then
            SetPedComponentVariation(PlayerPedId(), 4, 21, 0, 0)
        elseif Skin.GetPlayerSex() == "Female" then
            SetPedComponentVariation(PlayerPedId(), 4, 14, 0, 0)
        end

        Skin.PantsOn = false
    elseif Clothes == 4 then
        if Skin.GetPlayerSex() == "Male" then
            SetPedComponentVariation(PlayerPedId(), 6, 34, 0, 0)
        elseif Skin.GetPlayerSex() == "Female" then
            SetPedComponentVariation(PlayerPedId(), 6, 35, 0, 0)
        end

        Skin.ShoesOn = false
    end

    TriggerServerEvent("Skin:DeleteClothes", Clothes)
end

Skin.ClearClothes = function()
    if Skin.GetPlayerSex() == "Male" then
        SetPedPropIndex(PlayerPedId(), 0, 8, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 10, 0, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 11, 15, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 8, 15, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 3, 15, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 4, 21, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 6, 34, 0, 0)
    elseif Skin.GetPlayerSex() == "Female" then
        SetPedPropIndex(PlayerPedId(), 0, 120, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 10, 0, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 11, 5, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 8, 14, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 3, 15, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 4, 14, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 6, 35, 0, 0)
    end

    Skin.HatOn = false
    Skin.TshirtOn = false
    Skin.GlovesOn = false
    Skin.PantsOn = false
    Skin.ShoesOn = false
end