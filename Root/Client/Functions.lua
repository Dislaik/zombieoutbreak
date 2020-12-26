Utils = {}
Cam = {}
Root.UsableClothes = {}
ItemClothes = {}

Register.Clothes = function(Name, Sex, Clothes, DrawableId)
    if Root.UsableClothes[Name] == nil and ItemClothes[Name] == nil then
        ItemClothes[Name] = {}
        Root.UsableClothes[Name] = {}
    end

    ItemClothes[Name][Sex] = {Clothes, DrawableId}
    Root.UsableClothes[Name][Sex] = function()
        if Clothes == 0 then
            if not Skin.HatOn then
                Skin.SetClothes(Sex, Clothes, DrawableId)
            else
                if GetPedPropIndex(PlayerPedId(), 0) == DrawableId then
                    Skin.DeleteClothes(Clothes)
                else
                    Skin.SetClothes(Sex, Clothes, DrawableId)
                end
            end
        elseif Clothes == 1 then
            if not Skin.TshirtOn then
                Skin.SetClothes(Sex, Clothes, DrawableId)
            else
                if GetPedDrawableVariation(PlayerPedId(), 11) == DrawableId then
                    Skin.DeleteClothes(Clothes)
                else
                    Skin.SetClothes(Sex, Clothes, DrawableId)
                end
            end
        elseif Clothes == 2 then
            if not Skin.GlovesOn then
                Skin.SetClothes(Sex, Clothes, DrawableId)
            else
                if GetPedDrawableVariation(PlayerPedId(), 3) == DrawableId then
                    Skin.DeleteClothes(Clothes)
                else
                    Skin.SetClothes(Sex, Clothes, DrawableId)
                end
            end
        elseif Clothes == 3 then
            if not Skin.PantsOn then
                Skin.SetClothes(Sex, Clothes, DrawableId)
            else
                if GetPedDrawableVariation(PlayerPedId(), 4) == DrawableId then
                    Skin.DeleteClothes(Clothes)
                else
                    Skin.SetClothes(Sex, Clothes, DrawableId)
                end
            end
        elseif Clothes == 4 then
            if not Skin.ShoesOn then
                Skin.SetClothes(Sex, Clothes, DrawableId)
            else
                if GetPedDrawableVariation(PlayerPedId(), 6) == DrawableId then
                    Skin.DeleteClothes(Clothes)
                else
                    Skin.SetClothes(Sex, Clothes, DrawableId)
                end
            end
        end
    end
end