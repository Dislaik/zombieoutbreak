Utils = {}
Cam = {}
Root.UsableClothes = {}
Root.ItemClothes = {}

Register.Clothes = function(Item, Sex, Component, DrawableId)
    if Root.UsableClothes[Item] == nil and Root.ItemClothes[Item] == nil then
        Root.ItemClothes[Item] = {}
        Root.UsableClothes[Item] = {}
    end

    Root.ItemClothes[Item][Sex] = {Component, DrawableId}
    Root.UsableClothes[Item][Sex] = function()
        if Component == 0 then
            if not Skin.HatOn then
                Skin.SetClothes(Sex, Component, DrawableId)
            else
                if GetPedPropIndex(PlayerPedId(), 0) == DrawableId then
                    Skin.DeleteClothes(Component)
                else
                    Skin.SetClothes(Sex, Component, DrawableId)
                end
            end
        elseif Component == 1 then
            if not Skin.GlassesOn then
                Skin.SetClothes(Sex, Component, DrawableId)
            else
                if GetPedPropIndex(PlayerPedId(), 1) == DrawableId then
                    Skin.DeleteClothes(Component)
                else
                    Skin.SetClothes(Sex, Component, DrawableId)
                end
            end
        elseif Component == 2 then
            if not Skin.EarringsOn then
                Skin.SetClothes(Sex, Component, DrawableId)
            else
                if GetPedPropIndex(PlayerPedId(), 2) == DrawableId then
                    Skin.DeleteClothes(Component)
                else
                    Skin.SetClothes(Sex, Component, DrawableId)
                end
            end
        elseif Component == 3 then
            if not Skin.WatchOn then
                Skin.SetClothes(Sex, Component, DrawableId)
            else
                if GetPedPropIndex(PlayerPedId(), 6) == DrawableId then
                    Skin.DeleteClothes(Component)
                else
                    Skin.SetClothes(Sex, Component, DrawableId)
                end
            end
        elseif Component == 4 then
            if not Skin.BraceletOn then
                Skin.SetClothes(Sex, Component, DrawableId)
            else
                if GetPedPropIndex(PlayerPedId(), 7) == DrawableId then
                    Skin.DeleteClothes(Component)
                else
                    Skin.SetClothes(Sex, Component, DrawableId)
                end
            end
        elseif Component == 5 then
            if not Skin.MaskOn then
                Skin.SetClothes(Sex, Component, DrawableId)
            else
                if GetPedDrawableVariation(PlayerPedId(), 1) == DrawableId then
                    Skin.DeleteClothes(Component)
                else
                    Skin.SetClothes(Sex, Component, DrawableId)
                end
            end
        elseif Component == 6 then
            if not Skin.AccessoryOn then
                Skin.SetClothes(Sex, Component, DrawableId)
            else
                if GetPedDrawableVariation(PlayerPedId(), 7) == DrawableId then
                    Skin.DeleteClothes(Component)
                else
                    Skin.SetClothes(Sex, Component, DrawableId)
                end
            end
        elseif Component == 7 then
            if not Skin.TshirtOn then
                Skin.SetClothes(Sex, Component, DrawableId)
            else
                if GetPedDrawableVariation(PlayerPedId(), 11) == DrawableId then
                    Skin.DeleteClothes(Component)
                else
                    Skin.SetClothes(Sex, Component, DrawableId)
                end
            end
        elseif Component == 8 then
            if not Skin.GlovesOn then
                Skin.SetClothes(Sex, Component, DrawableId)
            else
                if GetPedDrawableVariation(PlayerPedId(), 3) == DrawableId then
                    Skin.DeleteClothes(Component)
                else
                    Skin.SetClothes(Sex, Component, DrawableId)
                end
            end
        elseif Component == 9 then
            if not Skin.ArmorOn then
                Skin.SetClothes(Sex, Component, DrawableId)
            else
                if GetPedDrawableVariation(PlayerPedId(), 9) == DrawableId then
                    Skin.DeleteClothes(Component)
                else
                    Skin.SetClothes(Sex, Component, DrawableId)
                end
            end
        elseif Component == 10 then
            if not Skin.BagOn then
                Skin.SetClothes(Sex, Component, DrawableId)
            else
                if GetPedDrawableVariation(PlayerPedId(), 5) == DrawableId then
                    Skin.DeleteClothes(Component)
                else
                    Skin.SetClothes(Sex, Component, DrawableId)
                end
            end
        elseif Component == 11 then
            if not Skin.PantsOn then
                Skin.SetClothes(Sex, Component, DrawableId)
            else
                if GetPedDrawableVariation(PlayerPedId(), 4) == DrawableId then
                    Skin.DeleteClothes(Component)
                else
                    Skin.SetClothes(Sex, Component, DrawableId)
                end
            end
        elseif Component == 12 then
            if not Skin.ShoesOn then
                Skin.SetClothes(Sex, Component, DrawableId)
            else
                if GetPedDrawableVariation(PlayerPedId(), 6) == DrawableId then
                    Skin.DeleteClothes(Component)
                else
                    Skin.SetClothes(Sex, Component, DrawableId)
                end
            end
        end
    end
end
