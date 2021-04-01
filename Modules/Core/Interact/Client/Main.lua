local Utils = M("Utils")
local Player = M("Player")
--local Inventory = New("Inventory")

local openNUI = false
local currentEntity
local rayCastTarget
local type

local materialHashes = {
    282940568,
    -1286696947
}
local trailers = {
    "armytanker",
    "armytrailer",
    "armytrailer2",
    "baletrailer",
    "boattrailer",
    "cablecar",
    "docktrailer",
    "freighttrailer",
    "graintrailer",
    "proptrailer",
    "raketrailer",
    "tr2",
    "tr3",
    "tr4",
    "trflat",
    "tvtrailer",
    "tanker",
    "tanker2",
    "trailerlarge",
    "trailerlogs",
    "trailersmall",
    "trailers",
    "trailers2",
    "trailers3",
    "trailers4"
}

local objectsHashes = {
    {Name = "Trash", Hash = 1329570871}
}

SetInterval(0, function()
    if Player:getPlayer():loaded() and not Player:getPlayer():isDead() then
        --if IsControlPressed(0, 38) then
            local hit, coords, materialground, entity = Module.RayCastGamePlayCamera(20.0)
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = Vdist(playerCoords, coords)
            --print(materialground)
            --print(entity, IsEntityAnObject(entity))
            if distance < 3.0 then
                if hit then
                    --if not type then
                        if IsEntityAVehicle(entity) then
                            type = "VEHICLE"
                            currentEntity = entity
                            if not rayCastTarget or rayCastTarget ~= GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(currentEntity))) then
                                rayCastTarget = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(entity)))
                            end
                        elseif IsEntityAnObject(entity) then
                            type = "OBJECT"
                            currentEntity = entity
                            if not rayCastTarget then
                                for _, i in pairs(objectsHashes) do
                                    if i.Hash == GetEntityModel(currentEntity) then
                                        rayCastTarget = i.Name
                                    end
                                end
                            end
                        else
                            local found = false

                            for _, material in pairs(materialHashes) do
                                if material == materialground then
                                    found = true
                                    type = "GROUND"

                                    if not rayCastTarget or rayCastTarget ~= "Ground" then
                                        rayCastTarget = "Ground"
                                    end
                                end
                            end
                            if not found then
                                if type or rayCastTarget then
                                    type = nil
                                    rayCastTarget = nil
                                end
                            end
                    --    end
                    end
                    Wait(100)
                end
            else
                if type or rayCastTarget then
                    type = nil
                    rayCastTarget = nil
                end
            end
        --else
        --    if type or rayCastTarget then
        --        type = nil
        --        rayCastTarget = nil
        --    end
        --end
    end
end)
SetDisableAmbientMeleeMove(PlayerPedId(), true)

SetInterval(0, function()
    if Player:getPlayer():loaded() and not Player:getPlayer():isDead() then
        local entityCoords = GetEntityCoords(currentEntity)
        --if IsControlPressed(0, 38) then
            --DisableControlAction(0, 24) -- attack
            --ShowHudComponentThisFrame(14)
            if openNUI then
                --Utils.drawText(entityCoords, 0.5, 0.5, 0.5, 4, 0, 100, 100, 100, 255, true)
                Utils.drawText3D(rayCastTarget, entityCoords.x, entityCoords.y, entityCoords.z, 0.5, 2)
                DisableControlAction(0, 1,   true) -- LookLeftRight
                DisableControlAction(0, 2,   true) -- LookUpDown
                DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
                DisableControlAction(0, 142, true) -- MeleeAttackAlternate
                DisableControlAction(0, 30,  true) -- MoveLeftRight
                DisableControlAction(0, 31,  true) -- MoveUpDown
                DisableControlAction(0, 22,  true) -- disable jump
                DisableControlAction(0, 21,  true) -- disable sprint
                DisableControlAction(0, 24,  true) -- disable attack
                DisableControlAction(0, 25,  true) -- disable aim
                DisableControlAction(0, 47,  true) -- disable weapon
                DisableControlAction(0, 58,  true) -- disable weapon
                DisableControlAction(0, 263, true) -- disable melee
                DisableControlAction(0, 264, true) -- disable melee
                DisableControlAction(0, 257, true) -- disable melee
                DisableControlAction(0, 140, true) -- disable melee
                DisableControlAction(0, 141, true) -- disable melee
                DisableControlAction(0, 143, true) -- disable melee
                DisableControlAction(0, 75,  true) -- disable exit vehicle
                DisableControlAction(27, 75, true) -- disable exit vehicle
            else
                --Utils.drawText(rayCastTarget, 0.5, 0.5, 0.5, 4, 0, 255, 255, 255, 255, true)
                Utils.drawText3D(rayCastTarget, entityCoords.x, entityCoords.y, entityCoords.z, 0.5, 2)
            end
        --end
    end

    if type == "VEHICLE" and IsControlJustReleased(0, 38) and not openNUI then
        local events = {
            {name = "ENTER_VEHICLE", label = "Enter vehicle"},
            {name = "OPEN_DOOR_DRIVER", label = "Open driver door"}
        }

        SetNuiFocus(true, true)
        SetNuiFocusKeepInput(true)
        SetCursorLocation(0.5, 0.5)
        SendNUIMessage({
            Type = "Interact",
            Display = true,
            Options = events,
            Target = currentEntity
        })
        
        openNUI = true
    elseif type == "GROUND" and IsControlJustReleased(0, 38) and not openNUI then
        local events = {
            {name = "PLAYER_SLEEP", label = "Sleep on the floor"},
            {name = "PLAYER_SIT", label = "Sit on the floor"}
        }

        SetNuiFocus(true, true)
        SetNuiFocusKeepInput(true)
        SetCursorLocation(0.5, 0.5)
        SendNUIMessage({
            Type = "Interact",
            Display = true,
            Options = events
        })
        openNUI = true
    elseif type == "OBJECT" and IsControlJustReleased(0, 38) and not openNUI then
        local events = {
            {name = "PLAYER_SLEEP", label = "Sleep on the floor"},
            {name = "PLAYER_SIT", label = "Sit on the floor"}
        }

        SetNuiFocus(true, true)
        SetNuiFocusKeepInput(true)
        SetCursorLocation(0.5, 0.5)
        SendNUIMessage({
            Type = "Interact",
            Display = true,
            Options = events,
            Target = currentEntity
        })

        openNUI = true   
    elseif openNUI and not type or openNUI and IsControlJustReleased(0, 38) then

        SetNuiFocus(false, false)
        SetNuiFocusKeepInput(false)
        SendNUIMessage({
            Type = "Interact",
            Display = false
        })
        
        openNUI = false
    end

    if IsPedArmed(PlayerPedId(), 6) then
        DisableControlAction(1, 140, true)
        DisableControlAction(1, 141, true)
        DisableControlAction(1, 142, true)
    end

    BlockWeaponWheelThisFrame()
    DisableControlAction(0, 37, true)
end)
--]]