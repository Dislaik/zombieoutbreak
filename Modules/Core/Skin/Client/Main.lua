--Load("Client/Events.lua")


Skin = {}

Skin.HatOn = false -- 0
Skin.GlassesOn = false -- New! 1
Skin.EarringsOn = false -- New! 2
Skin.WatchOn = false -- New! 3
Skin.BraceletOn = false -- New! 4
Skin.MaskOn = false -- New! 5
Skin.AccessoryOn = false -- New! 6
Skin.TshirtOn = false -- 7
Skin.GlovesOn = false -- 8
Skin.ArmorOn = false -- New! 9
Skin.BagOn = false -- New 10
Skin.PantsOn = false -- 11
Skin.ShoesOn = false -- 12
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

Skin.SetClothes = function(Sex, Component, DrawableId, TextureIdl, PaletteId)
    TextureIdl = TextureIdl or 0
    PaletteId = PaletteId or 0
    
    TriggerServerEvent("Skin:SetClothes", Component, DrawableId)

    if Component == 0 then
        if Sex == "Male" then
            SetPedPropIndex(PlayerPedId(), 0, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedPropIndex(PlayerPedId(), 0, DrawableId, TextureIdl, PaletteId)
        end

        Skin.HatOn = true
    elseif Component == 1 then
        if Sex == "Male" then
            SetPedPropIndex(PlayerPedId(), 1, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedPropIndex(PlayerPedId(), 1, DrawableId, TextureIdl, PaletteId)
        end

        Skin.GlassesOn = true
    elseif Component == 2 then
        if Sex == "Male" then
            SetPedPropIndex(PlayerPedId(), 2, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedPropIndex(PlayerPedId(), 2, DrawableId, TextureIdl, PaletteId)
        end

        Skin.EarringsOn = true
    elseif Component == 3 then
        if Sex == "Male" then
            SetPedPropIndex(PlayerPedId(), 6, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedPropIndex(PlayerPedId(), 6, DrawableId, TextureIdl, PaletteId)
        end

        Skin.WatchOn = true
    elseif Component == 4 then
        if Sex == "Male" then
            SetPedPropIndex(PlayerPedId(), 7, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedPropIndex(PlayerPedId(), 7, DrawableId, TextureIdl, PaletteId)
        end

        Skin.BraceletOn = true
    elseif Component == 5 then
        if Sex == "Male" then
            SetPedComponentVariation(PlayerPedId(), 1, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedComponentVariation(PlayerPedId(), 1, DrawableId, TextureIdl, PaletteId)
        end

        Skin.MaskOn = true
    elseif Component == 6 then
        if Sex == "Male" then
            SetPedComponentVariation(PlayerPedId(), 7, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedComponentVariation(PlayerPedId(), 7, DrawableId, TextureIdl, PaletteId)
        end

        Skin.AccessoryOn = true
    elseif Component == 7 then
        if Sex == "Male" then
            SetPedComponentVariation(PlayerPedId(), 11, DrawableId, TextureIdl, PaletteId)

            if DrawableId == 55 then
                SetPedComponentVariation(PlayerPedId(), 10, 8, 1, 0)
                SetPedComponentVariation(PlayerPedId(), 8, 129, 0, 0)
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
                SetPedComponentVariation(PlayerPedId(), 10, 7, 1, 0)
                SetPedComponentVariation(PlayerPedId(), 8, 159, 0, 0)
                SetPedComponentVariation(PlayerPedId(), 3, 14, 0, 0)
            elseif DrawableId == 258 then
                SetPedComponentVariation(PlayerPedId(), 10, 66, 0, 0)
                SetPedComponentVariation(PlayerPedId(), 8, 14, 0, 0)
                SetPedComponentVariation(PlayerPedId(), 3, 14, 0, 0)
            end
        end

        Skin.TshirtOn = true
    elseif Component == 8 then
        if Sex == "Male" then
            SetPedComponentVariation(PlayerPedId(), 3, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedComponentVariation(PlayerPedId(), 3, DrawableId, TextureIdl, PaletteId)
        end

        Skin.GlovesOn = true
    elseif Component == 9 then
        if Sex == "Male" then
            SetPedComponentVariation(PlayerPedId(), 9, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedComponentVariation(PlayerPedId(), 9, DrawableId, TextureIdl, PaletteId)
        end
        
        Skin.ArmorOn = true
    elseif Component == 10 then
        if Sex == "Male" then
            SetPedComponentVariation(PlayerPedId(), 5, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedComponentVariation(PlayerPedId(), 5, DrawableId, TextureIdl, PaletteId)
        end

        Skin.BagOn = true
    elseif Component == 11 then
        if Sex == "Male" then
            SetPedComponentVariation(PlayerPedId(), 4, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedComponentVariation(PlayerPedId(), 4, DrawableId, TextureIdl, PaletteId)
        end

        Skin.PantsOn = true
    elseif Component == 12 then
        if Sex == "Male" then
            SetPedComponentVariation(PlayerPedId(), 6, DrawableId, TextureIdl, PaletteId)
        elseif Sex == "Female" then
            SetPedComponentVariation(PlayerPedId(), 6, DrawableId, TextureIdl, PaletteId)
        end
        Skin.ShoesOn = true
    end

end

Skin.DeleteClothes = function(Component) --- -1 (Remove all)
    if Component == 0 then
        ClearPedProp(PlayerPedId(), 0)

        Skin.HatOn = false
    elseif Component == 1 then
        ClearPedProp(PlayerPedId(), 1)

        Skin.GlassesOn = false
    elseif Component == 2 then
        ClearPedProp(PlayerPedId(), 2)
        
        Skin.EarringsOn = false
    elseif Component == 3 then
        ClearPedProp(PlayerPedId(), 6)

        Skin.WatchOn = false
    elseif Component == 4 then
        ClearPedProp(PlayerPedId(), 7)

        Skin.BraceletOn = false
    elseif Component == 5 then
        if Skin.GetPlayerSex() == "Male" then
            SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 0)
        elseif Skin.GetPlayerSex() == "Female" then
            SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 0)
        end

        Skin.MaskOn = false
    elseif Component == 6 then
        if Skin.GetPlayerSex() == "Male" then
            SetPedComponentVariation(PlayerPedId(), 7, 0, 0, 0)
        elseif Skin.GetPlayerSex() == "Female" then
            SetPedComponentVariation(PlayerPedId(), 7, 0, 0, 0)
        end

        Skin.AccessoryOn = false
    elseif Component == 7 then
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
    elseif Component == 8 then
        if Skin.GetPlayerSex() == "Male" then
            SetPedComponentVariation(PlayerPedId(), 3, 15, 0, 0)
        elseif Skin.GetPlayerSex() == "Female" then
            SetPedComponentVariation(PlayerPedId(), 3, 15, 0, 0)
        end

        Skin.GlovesOn = false
    elseif Component == 9 then
        if Skin.GetPlayerSex() == "Male" then
            SetPedComponentVariation(PlayerPedId(), 9, 0, 0, 0)
        elseif Skin.GetPlayerSex() == "Female" then
            SetPedComponentVariation(PlayerPedId(), 9, 0, 0, 0)
        end

        Skin.ArmorOn = false
    elseif Component == 10 then
        if Skin.GetPlayerSex() == "Male" then
            SetPedComponentVariation(PlayerPedId(), 5, 0, 0, 0)
        elseif Skin.GetPlayerSex() == "Female" then
            SetPedComponentVariation(PlayerPedId(), 5, 0, 0, 0)
        end

        Skin.BagOn = false
    elseif Component == 11 then
        if Skin.GetPlayerSex() == "Male" then
            SetPedComponentVariation(PlayerPedId(), 4, 21, 0, 0)
        elseif Skin.GetPlayerSex() == "Female" then
            SetPedComponentVariation(PlayerPedId(), 4, 14, 0, 0)
        end

        Skin.PantsOn = false
    elseif Component == 12 then
        if Skin.GetPlayerSex() == "Male" then
            SetPedComponentVariation(PlayerPedId(), 6, 34, 0, 0)
        elseif Skin.GetPlayerSex() == "Female" then
            SetPedComponentVariation(PlayerPedId(), 6, 35, 0, 0)
        end

        Skin.ShoesOn = false
    end

    TriggerServerEvent("Skin:DeleteClothes", Component)
end

Skin.ClearClothes = function()
    ClearPedProp(PlayerPedId(), 0)
    ClearPedProp(PlayerPedId(), 1)
    ClearPedProp(PlayerPedId(), 2)
    ClearPedProp(PlayerPedId(), 6)
    ClearPedProp(PlayerPedId(), 7)

    if Skin.GetPlayerSex() == "Male" then
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
    elseif Skin.GetPlayerSex() == "Female" then
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

    Skin.HatOn = false
    Skin.TshirtOn = false
    Skin.GlovesOn = false
    Skin.PantsOn = false
    Skin.ShoesOn = false
end