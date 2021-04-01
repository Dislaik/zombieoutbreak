local Player = M("Player")
local Utils = M("Utils")




SetInterval(5000, function(id)
    if Module.loaded() then
        Module.hunger = Module.hunger - (Utils.random(1, 19) / 100)
        Module.thirst = Module.thirst - (Utils.random(5, 24) / 100)
        --print("Blood:", Module.blood)
        --print("Hunger:", Module.hunger)
        --print("Thirst:", Module.thirst)
    end
end)