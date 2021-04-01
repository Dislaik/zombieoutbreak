Module.HatOn = false
Module.GlassesOn = false
Module.EarringsOn = false
Module.WatchOn = false
Module.BraceletOn = false
Module.MaskOn = false
Module.AccessoryOn = false
Module.TshirtOn = false
Module.GlovesOn = false
Module.ArmorOn = false
Module.BagOn = false
Module.PantsOn = false 
Module.ShoesOn = false
Module.ActiveClothes = {}

Module.GetPlayerSex = function(Player) 
    local Hash = GetEntityModel(Player)

    if Hash == GetHashKey("mp_m_freemode_01") then
        return "Male"
    elseif Hash == GetHashKey("mp_f_freemode_01") then
        return "Female"
    end

    return "None"
end

Module.SetPlayerDefaultComponents = function(Sex)
    if (Sex == "Male") then
        SetPedHeadBlendData(PlayerPedId(), 0, 0, 0, 0, 0, 0, 0, 0, 0, false)
        SetPedComponentVariation(PlayerPedId(), 2, 0, 0, 0)
        SetPedHairColor(PlayerPedId(), 0, 0)
        SetPedEyeColor(PlayerPedId(), 0)
        SetPedHeadOverlay(PlayerPedId(), 0, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 1, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 2, 0, 1.0)
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
        SetPedHeadOverlay(PlayerPedId(), 2, 0, 1.0)
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

Module.SetPlayerDefaultComponents = function(Sex)
    if (Sex == "Male") then
        SetPedHeadBlendData(PlayerPedId(), 0, 0, 0, 0, 0, 0, 0, 0, 0, false)
        SetPedComponentVariation(PlayerPedId(), 2, 0, 0, 0)
        SetPedHairColor(PlayerPedId(), 0, 0)
        SetPedEyeColor(PlayerPedId(), 0)
        SetPedHeadOverlay(PlayerPedId(), 0, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 1, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 2, 0, 1.0)
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
        SetPedHeadOverlay(PlayerPedId(), 2, 0, 1.0)
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

Module.SetPlayerComponents = function(Sex, skinDictionary)
    if (Sex == "Male") then
    SetPedHeadBlendData(PlayerPedId(), skinDictionary.face, 0, 0, skinDictionary.skin, 0, 0, 0, 0, 0, false)
    SetPedComponentVariation(PlayerPedId(), 2, skinDictionary.hair, 0, 0)
    SetPedHairColor(PlayerPedId(), skinDictionary.hairColor, 0)
    SetPedEyeColor(PlayerPedId(), skinDictionary.eyes)
    SetPedHeadOverlay(PlayerPedId(), 2, skinDictionary.eyebrows, 1.0)
    if (skinDictionary.beards == -1) then SetPedHeadOverlay(PlayerPedId(), 1, 0, 0)
    else SetPedHeadOverlay(PlayerPedId(), 1, skinDictionary.beards, 1.0) end
    if (skinDictionary.chest == -1) then SetPedHeadOverlay(PlayerPedId(), 10, 0, 0)
    else SetPedHeadOverlay(PlayerPedId(), 10, skinDictionary.chest, 1.0) end
    SetPedHeadOverlayColor(PlayerPedId(), 1, 1, skinDictionary.hairColor, 0)
    SetPedHeadOverlayColor(PlayerPedId(), 2, 1, skinDictionary.hairColor, 0)
    SetPedHeadOverlayColor(PlayerPedId(), 10, 1, skinDictionary.hairColor, 0)
        --SetPedHeadBlendData(PlayerPedId(), 0, 0, 0, 0, 0, 0, 0, 0, 0, false)
        --SetPedComponentVariation(PlayerPedId(), 2, 0, 0, 0)
        --SetPedHairColor(PlayerPedId(), 0, 0)
        --SetPedEyeColor(PlayerPedId(), 0)
        SetPedHeadOverlay(PlayerPedId(), 0, 0, 0)
        --SetPedHeadOverlay(PlayerPedId(), 1, 0, 0)
        --SetPedHeadOverlay(PlayerPedId(), 2, 0, 1.0)
        --SetPedHeadOverlayColor(PlayerPedId(), 1, 1, 0, 0)
        --SetPedHeadOverlayColor(PlayerPedId(), 2, 1, 0, 0)
        --SetPedHeadOverlayColor(PlayerPedId(), 10, 1, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 3, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 6, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 7, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 9, 0, 0)
        --SetPedHeadOverlay(PlayerPedId(), 10, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 11, 0, 0)
        SetPedPropIndex(PlayerPedId(), 0, 8, 0, true)
        SetPedComponentVariation(PlayerPedId(), 11, 15, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 8, 15, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 3, 15, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 4, 21, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 6, 34, 0, 0)
    else
        SetPedHeadBlendData(PlayerPedId(), skinDictionary.face, 0, 0, skinDictionary.skin, 0, 0, 0, 0, 0, false)
    SetPedComponentVariation(PlayerPedId(), 2, skinDictionary.hair, 0, 0)
    SetPedHairColor(PlayerPedId(), skinDictionary.hairColor, 0)
    SetPedEyeColor(PlayerPedId(), skinDictionary.eyes)
    SetPedHeadOverlay(PlayerPedId(), 2, skinDictionary.eyebrows, 1.0)
    if (skinDictionary.beards == -1) then SetPedHeadOverlay(PlayerPedId(), 1, 0, 0)
    else SetPedHeadOverlay(PlayerPedId(), 1, skinDictionary.beards, 1.0) end
    if (skinDictionary.chest == -1) then SetPedHeadOverlay(PlayerPedId(), 10, 0, 0)
    else SetPedHeadOverlay(PlayerPedId(), 10, skinDictionary.chest, 1.0) end
    SetPedHeadOverlayColor(PlayerPedId(), 1, 1, skinDictionary.hairColor, 0)
    SetPedHeadOverlayColor(PlayerPedId(), 2, 1, skinDictionary.hairColor, 0)
    SetPedHeadOverlayColor(PlayerPedId(), 10, 1, skinDictionary.hairColor, 0)
        --SetPedHeadBlendData(PlayerPedId(), 21, 0, 0, 0, 0, 0, 0, 0, 0, false)
        --SetPedComponentVariation(PlayerPedId(), 2, 0, 0, 0)
        --SetPedHairColor(PlayerPedId(), 0, 0)
        --SetPedEyeColor(PlayerPedId(), 0)
        SetPedHeadOverlay(PlayerPedId(), 0, 0, 0)
        --SetPedHeadOverlay(PlayerPedId(), 1, 0, 0)
        --SetPedHeadOverlay(PlayerPedId(), 2, 0, 1.0)
        --SetPedHeadOverlayColor(PlayerPedId(), 1, 1, 0, 0)
        --SetPedHeadOverlayColor(PlayerPedId(), 2, 1, 0, 0)
        --SetPedHeadOverlayColor(PlayerPedId(), 10, 1, 0, 0)
        --SetPedHeadOverlay(PlayerPedId(), 3, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 6, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 7, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 9, 0, 0)
        --SetPedHeadOverlay(PlayerPedId(), 10, 0, 0)
        SetPedHeadOverlay(PlayerPedId(), 11, 0, 0)
        SetPedPropIndex(PlayerPedId(), 0, 120, 0, true)
        SetPedComponentVariation(PlayerPedId(), 11, 5, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 8, 14, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 3, 15, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 4, 14, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 6, 35, 0, 0)
    end
end

Module.SetClothes = function(PedId, Component, DrawableId, TextureIdl, PaletteId)
    TextureIdl = TextureIdl or 0
    PaletteId = PaletteId or 0
    
    TriggerServerEvent("Skin:SetClothes", Component, DrawableId)

    if Component == 0 then
        if Sex == "Male" then
            SetPedPropIndex(PlayerPedId(), 0, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedPropIndex(PlayerPedId(), 0, DrawableId, TextureIdl, PaletteId)
        end

        Module.HatOn = true
    elseif Component == 1 then
        if Sex == "Male" then
            SetPedPropIndex(PlayerPedId(), 1, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedPropIndex(PlayerPedId(), 1, DrawableId, TextureIdl, PaletteId)
        end

        Module.GlassesOn = true
    elseif Component == 2 then
        if Sex == "Male" then
            SetPedPropIndex(PlayerPedId(), 2, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedPropIndex(PlayerPedId(), 2, DrawableId, TextureIdl, PaletteId)
        end

        Module.EarringsOn = true
    elseif Component == 3 then
        if Sex == "Male" then
            SetPedPropIndex(PlayerPedId(), 6, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedPropIndex(PlayerPedId(), 6, DrawableId, TextureIdl, PaletteId)
        end

        Module.WatchOn = true
    elseif Component == 4 then
        if Sex == "Male" then
            SetPedPropIndex(PlayerPedId(), 7, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedPropIndex(PlayerPedId(), 7, DrawableId, TextureIdl, PaletteId)
        end

        Module.BraceletOn = true
    elseif Component == 5 then
        if Sex == "Male" then
            SetPedComponentVariation(PlayerPedId(), 1, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedComponentVariation(PlayerPedId(), 1, DrawableId, TextureIdl, PaletteId)
        end

        Module.MaskOn = true
    elseif Component == 6 then
        if Sex == "Male" then
            SetPedComponentVariation(PlayerPedId(), 7, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedComponentVariation(PlayerPedId(), 7, DrawableId, TextureIdl, PaletteId)
        end

        Module.AccessoryOn = true
    elseif (Component == 7) then
        if (Module.GetPlayerSex(PedId) == "Male") then
            SetPedComponentVariation(PedId, 11, DrawableId, TextureIdl, PaletteId)

            if (DrawableId == 22) then
                SetPedComponentVariation(PedId, 10, 0, 0, 0)
                SetPedComponentVariation(PedId, 8, 15, 0, 0)
                SetPedComponentVariation(PedId, 3, 0, 0, 0)
            elseif DrawableId == 55 then
                SetPedComponentVariation(PedId, 10, 8, 1, 0)
                SetPedComponentVariation(PedId, 8, 129, 0, 0)
                SetPedComponentVariation(PedId, 3, 0, 0, 0)
            elseif DrawableId == 56 then
                SetPedComponentVariation(PedId, 10, 0, 0, 0)
                SetPedComponentVariation(PedId, 8, 15, 0, 0)
                SetPedComponentVariation(PedId, 3, 0, 0, 0)
            elseif DrawableId == 250 then
                SetPedComponentVariation(PedId, 10, 58, 0, 0)
                SetPedComponentVariation(PedId, 8, 15, 0, 0)
                SetPedComponentVariation(PedId, 3, 0, 0, 0)
            end

        elseif (Module.GetPlayerSex(PedId) == "Female") then
            SetPedComponentVariation(PedId, 11, DrawableId, TextureIdl, PaletteId)

            if (DrawableId == 73) then
                SetPedComponentVariation(PedId, 10, 0, 0, 0)
                SetPedComponentVariation(PedId, 8, 15, 0, 0)
                SetPedComponentVariation(PedId, 3, 14, 0, 0)
            elseif DrawableId == 49 then
                SetPedComponentVariation(PedId, 10, 0, 0, 0)
                SetPedComponentVariation(PedId, 8, 14, 0, 0)
                SetPedComponentVariation(PedId, 3, 14, 0, 0)
            elseif DrawableId == 48 then
                SetPedComponentVariation(PedId, 10, 7, 1, 0)
                SetPedComponentVariation(PedId, 8, 159, 0, 0)
                SetPedComponentVariation(PedId, 3, 14, 0, 0)
            elseif DrawableId == 258 then
                SetPedComponentVariation(PedId, 10, 66, 0, 0)
                SetPedComponentVariation(PedId, 8, 14, 0, 0)
                SetPedComponentVariation(PedId, 3, 14, 0, 0)
            end
        end

        Module.TshirtOn = true
    elseif Component == 8 then
        if Sex == "Male" then
            SetPedComponentVariation(PlayerPedId(), 3, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedComponentVariation(PlayerPedId(), 3, DrawableId, TextureIdl, PaletteId)
        end

        Module.GlovesOn = true
    elseif Component == 9 then
        if Sex == "Male" then
            SetPedComponentVariation(PlayerPedId(), 9, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedComponentVariation(PlayerPedId(), 9, DrawableId, TextureIdl, PaletteId)
        end
        
        Module.ArmorOn = true
    elseif Component == 10 then
        if Sex == "Male" then
            SetPedComponentVariation(PlayerPedId(), 5, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedComponentVariation(PlayerPedId(), 5, DrawableId, TextureIdl, PaletteId)
        end

        Module.BagOn = true
    elseif (Component == 11) then
        if (Module.GetPlayerSex(PedId) == "Male") then
            SetPedComponentVariation(PedId, 4, DrawableId, TextureIdl, PaletteId)
        elseif (Module.GetPlayerSex(PedId) == "Female") then
            SetPedComponentVariation(PedId, 4, DrawableId, TextureIdl, PaletteId)
        end

        Module.PantsOn = true
    elseif (Component == 12) then
        if (Module.GetPlayerSex(PedId) == "Male") then
            SetPedComponentVariation(PedId, 6, DrawableId, TextureIdl, PaletteId)
        elseif (Module.GetPlayerSex(PedId) == "Female") then
            SetPedComponentVariation(PedId, 6, DrawableId, TextureIdl, PaletteId)
        end
        Module.ShoesOn = true
    end
end

Module.DeleteClothes = function(PedId, Component) --- -1 (Remove all)
    if (Component == 0) then
        ClearPedProp(PedId, 0)

        Module.HatOn = false
    elseif (Component == 1) then
        ClearPedProp(PedId, 1)

        Module.GlassesOn = false
    elseif Component == 2 then
        ClearPedProp(PedId, 2)
        
        Module.EarringsOn = false
    elseif Component == 3 then
        ClearPedProp(PedId, 6)

        Module.WatchOn = false
    elseif Component == 4 then
        ClearPedProp(PedId, 7)

        Module.BraceletOn = false
    elseif Component == 5 then
        if Module.GetPlayerSex() == "Male" then
            SetPedComponentVariation(PedId, 1, 0, 0, 0)
        elseif Module.GetPlayerSex() == "Female" then
            SetPedComponentVariation(PedId, 1, 0, 0, 0)
        end

        Module.MaskOn = false
    elseif Component == 6 then
        if Module.GetPlayerSex() == "Male" then
            SetPedComponentVariation(PedId, 7, 0, 0, 0)
        elseif Module.GetPlayerSex() == "Female" then
            SetPedComponentVariation(PedId, 7, 0, 0, 0)
        end

        Module.AccessoryOn = false
    elseif (Component == 7) then
        if (Module.GetPlayerSex(PedId) == "Male") then
            SetPedComponentVariation(PedId, 10, 0, 0, 0)
            SetPedComponentVariation(PedId, 11, 15, 0, 0)
            SetPedComponentVariation(PedId, 8, 15, 0, 0)
            SetPedComponentVariation(PedId, 3, 15, 0, 0)
        elseif (Module.GetPlayerSex(PedId) == "Female") then
            SetPedComponentVariation(PedId, 10, 0, 0, 0)
            SetPedComponentVariation(PedId, 11, 5, 0, 0)
            SetPedComponentVariation(PedId, 8, 14, 0, 0)
            SetPedComponentVariation(PedId, 3, 15, 0, 0)
        end

        Module.TshirtOn = false
    elseif Component == 8 then
        if Module.GetPlayerSex() == "Male" then
            SetPedComponentVariation(PedId, 3, 15, 0, 0)
        elseif Module.GetPlayerSex() == "Female" then
            SetPedComponentVariation(PedId, 3, 15, 0, 0)
        end

        Module.GlovesOn = false
    elseif Component == 9 then
        if Module.GetPlayerSex() == "Male" then
            SetPedComponentVariation(PedId, 9, 0, 0, 0)
        elseif Module.GetPlayerSex() == "Female" then
            SetPedComponentVariation(PedId, 9, 0, 0, 0)
        end

        Module.ArmorOn = false
    elseif Component == 10 then
        if Module.GetPlayerSex() == "Male" then
            SetPedComponentVariation(PedId, 5, 0, 0, 0)
        elseif Module.GetPlayerSex() == "Female" then
            SetPedComponentVariation(PedId, 5, 0, 0, 0)
        end

        Module.BagOn = false
    elseif (Component == 11) then
        if (Module.GetPlayerSex(PedId) == "Male") then
            SetPedComponentVariation(PedId, 4, 21, 0, 0)
        elseif (Module.GetPlayerSex(PedId) == "Female") then
            SetPedComponentVariation(PedId, 4, 14, 0, 0)
        end

        Module.PantsOn = false
    elseif (Component == 12) then
        if (Module.GetPlayerSex(PedId) == "Male") then
            SetPedComponentVariation(PedId, 6, 34, 0, 0)
        elseif (Module.GetPlayerSex(PedId) == "Female") then
            SetPedComponentVariation(PedId, 6, 35, 0, 0)
        end

        Module.ShoesOn = false
    end

    TriggerServerEvent("Skin:DeleteClothes", Component)
end

Module.ClearClothes = function()
    ClearPedProp(PlayerPedId(), 0)
    ClearPedProp(PlayerPedId(), 1)
    ClearPedProp(PlayerPedId(), 2)
    ClearPedProp(PlayerPedId(), 6)
    ClearPedProp(PlayerPedId(), 7)

    if Module.GetPlayerSex() == "Male" then
        SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 7, 0, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 10, 0, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 11, 15, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 8, 15, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 3, 15, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 9, 0, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 5, 0, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 4, 21, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 6, 34, 0, 0)
    elseif Module.GetPlayerSex() == "Female" then
        SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 7, 0, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 10, 0, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 11, 5, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 8, 14, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 3, 15, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 9, 0, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 5, 0, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 4, 14, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 6, 35, 0, 0)
    end

    Module.HatOn = false
    Module.GlassesOn = false
    Module.EarringsOn = false
    Module.WatchOn = false
    Module.BraceletOn = false
    Module.MaskOn = false
    Module.AccessoryOn = false
    Module.TshirtOn = false
    Module.GlovesOn = false
    Module.ArmorOn = false
    Module.BagOn = false
    Module.PantsOn = false 
    Module.ShoesOn = false
end