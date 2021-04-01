
Module.Translations = Load("Data/Locales/".. Config.Lang ..".lua")["Translations"]
Module.Config = Load("Data/Config.lua")["Config"]

Module.PlayerItems = nil

Module.redefinePlayerItems = function(playerInventory)
    if playerInventory then

        for i in pairs(playerInventory) do
            for j in pairs(Items) do

                if playerInventory[i].Name == string.lower(j) then

                    if Items[j].Type == "Normal" then

                        playerInventory[i].Type = Items[j].Type
                        playerInventory[i].Weight = Items[j].Weight
                        playerInventory[i].Icon = Items[j].Icon
                        playerInventory[i].Label = Items[j].Label
                        playerInventory[i].Description = Items[j].Description

                    elseif Items[j].Type == "Food" then

                        playerInventory[i].Type = Items[j].Type
                        playerInventory[i].Weight = Items[j].Weight
                        playerInventory[i].Icon = Items[j].Icon
                        playerInventory[i].TypeFood = Items[j].TypeFood
                        playerInventory[i].Label = Items[j].Label
                        playerInventory[i].Description = Items[j].Description
                        playerInventory[i].Hunger = Items[j].Hunger
                        playerInventory[i].Thirst = Items[j].Thirst

                    elseif Items[j].Type == "Medicine" then

                    elseif Items[j].Type == "Clothing" then

                    elseif Items[j].Type == "Weapon" then

                    end

                end

            end
        end

        return playerInventory
    end

end