local Player = M("Player");
local Utils = M("Utils");
--local Inventory = New("Inventory")

local PlayerGroup, ZombieGroup = "PLAYER", "ZOMBIE"
local Shooting, Running, Driving = false, false, false
DecorRegister("ZOMBIE", 2)
--DecorRegister("ZombieLoot", 2)
--local ZombieGrunt = {"zombie2", "zombie3", "zombie4", "zombie5", "zombie6", "zombie8", "zombie9", "zombie11", "zombie12", "zombie13",
--	"zombie14", "zombie16", "zombie17", "zombie18", "zombie19", "zombie20"}

--local ZombieGruntAlert = {"zombie1", "zombie7", "zombie10", "zombie15"}
---SetFocusEntity() --- para focusear al ped zombie
local WalkStyle = {
	"move_m@drunk@verydrunk",
	"move_m@drunk@moderatedrunk",
	"move_m@drunk@a",
	"anim_group_move_ballistic",
	"move_lester_CaneUp"
}

AddRelationshipGroup(ZombieGroup)
SetRelationshipBetweenGroups(0, GetHashKey(ZombieGroup), GetHashKey(PlayerGroup))
SetRelationshipBetweenGroups(5, GetHashKey(PlayerGroup), GetHashKey(ZombieGroup))

SetInterval(0, function()
    local PedHandler = -1
    local Success = false
    local Handler, PedHandler = FindFirstPed()

    repeat
        Wait(0)
            
        if IsPedHuman(PedHandler) and not IsPedAPlayer(PedHandler) and not IsPedDeadOrDying(PedHandler, true) then
            if DecorExistOn(PedHandler, "ZOMBIE") then
                for _, PlayerIndex in pairs(GetActivePlayers()) do
                    local PlayerId = GetPlayerFromServerId(PlayerIndex)
                    local PlayerPed = GetPlayerPed(PlayerId)
                    local PlayerCoords = GetEntityCoords(PlayerPed)
                    local PedCoords = GetEntityCoords(PedHandler)
                    local Distance = Vdist(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, PedCoords.x, PedCoords.y, PedCoords.z)
                    local DistanceTarget = Module.Config.DistanceTarget

                    --[[if Player.Shooting(PlayerPed) then
                        DistanceTarget = Module.Config.DistanceTarget + 100.0
                    elseif Player.Running(PlayerPed) then
                        DistanceTarget = Module.Config.DistanceTarget + 10.0
                    elseif Player.Driving(PlayerPed) then
                        local Vehicle = GetVehiclePedIsIn(PlayerPed, false)
                        if GetVehicleClass(Vehicle) == 15 or GetVehicleClass(Vehicle) == 16 then
                            DistanceTarget = Module.Config.DistanceTarget + 100.0
                        else
                            DistanceTarget = Module.Config.DistanceTarget + 50.0
                        end
                    end--]]


                    if Distance <= 5.0 then
                        TaskGoStraightToCoord(PedHandler, PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, 1.4, -1, 0.0, 1)
                    elseif Distance <= DistanceTarget then
                        TaskGoStraightToCoord(PedHandler, PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, 1.0, -1, 0.0, 1)
                    end
                end

                --if not NetworkGetEntityIsNetworked(PedHandler) then
                --    DeleteEntity(PedHandler)
                --end

            else
                if not IsPedModel(PedHandler, GetHashKey("mp_m_freemode_01")) and not IsPedModel(PedHandler, GetHashKey("mp_f_freemode_01")) then

                    if IsPedInAnyHeli(PedHandler) or IsPedInAnyPlane(PedHandler) then
                        local VehiclePedHandler = GetVehiclePedIsIn(PedHandler, true)
                        DeleteEntity(VehiclePedHandler)
                    end

                    SetPedRelationshipGroupHash(PedHandler, ZombieGroup)

                    Module.ResetAttributes(PedHandler)
                    Module.ZombieAttributes(PedHandler)

                    local Walk = WalkStyle[Utils.random(1, #WalkStyle)]

                    RequestAnimSet(Walk)
                    while not HasAnimSetLoaded(Walk) do
                        Wait(0)
                    end

                    SetPedMovementClipset(PedHandler, Walk, 1.0)

                    DecorSetBool(PedHandler, "ZOMBIE", true)
                end
            end
        end

        Success, PedHandler = FindNextPed(Handler)
    until not (Success)

    EndFindPed(Handler)
end)

SetInterval(0, function()
    local PedHandler = -1
    local Success = false
    local Handler, PedHandler = FindFirstPed()

    repeat
        Wait(0)
            
        if IsPedHuman(PedHandler) and not IsPedAPlayer(PedHandler) and not IsPedDeadOrDying(PedHandler, true) then
            if DecorExistOn(PedHandler, "ZOMBIE") then
                for _, PlayerIndex in pairs(GetActivePlayers()) do
                    local PlayerId = GetPlayerFromServerId(PlayerIndex)
                    local PlayerPed = GetPlayerPed(PlayerId)
                    local PlayerCoords = GetEntityCoords(PlayerPed)
                    local PedCoords = GetEntityCoords(PedHandler)
                    local Distance = Vdist(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, PedCoords.x, PedCoords.y, PedCoords.z)

                    if (Distance <= 1.2) then
                        if not IsPedRagdoll(PedHandler) and not IsPedGettingUp(PedHandler) then
                            if GetMeleeTargetForPed(PlayerPed) ~= PedHandler then
                                RequestAnimSet("melee@unarmed@streamed_core_fps")
                                while not HasAnimSetLoaded("melee@unarmed@streamed_core_fps") do
                                    Wait(0)
                                end
        
                                TaskPlayAnim(PedHandler, "melee@unarmed@streamed_core_fps", "ground_attack_0_psycho", 8.0, 1.0, -1, 48, 0.001, false, false, false)
        
                                ApplyDamageToPed(PlayerPed, Module.Config.ZombieDamage, true)

                                --if DecorGetBool(PlayerPed, "PLAYER_DEAD") then
                                    --DecorExistOn(PlayerPed, "PLAYER_ZOMBIFIED")
                                    --print("Player se murioxd")
                                    --Module.Zombified(PlayerPed)
                                --end
                                --AÑADIR PROBABILIDAD DE INFECCION
                                Wait(1000)
                            end
                        end
                    end
                end
            end
        end

        Success, PedHandler = FindNextPed(Handler)
    until not (Success)

    EndFindPed(Handler)
end)

--[[
SetInterval(0, function()
    local PedHandler = -1
    local Success = false
    local Handler, PedHandler = FindFirstPed()

    repeat

        if IsPedHuman(PedHandler) and not IsPedAPlayer(PedHandler) and IsPedDeadOrDying(PedHandler, true) then
            local PlayerCoords = GetEntityCoords(PlayerPedId())
            local PedCoords = GetEntityCoords(PedHandler)
            local Distance = Vdist(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, PedCoords.x, PedCoords.y, PedCoords.z)

            if not DecorExistOn(PedHandler, "ZombieLoot") then
                local ProbabilityLoot = 0
                for i in pairs(Config.LootProbability) do
                    ProbabilityLoot = ProbabilityLoot + Config.LootProbability[i]
                end
                if Utils.Random(1, 100) <= ProbabilityLoot then
                    DecorSetBool(PedHandler, "ZombieLoot", true)
                    TriggerServerEvent("Plague:LootCorpse", PedHandler, Config.Loot, ProbabilityLoot)
                else
                    DecorSetBool(PedHandler, "ZombieLoot", false)
                end
            end

            if Distance <= 1.2 and not IsPedInAnyVehicle(PlayerPedId(), true) and DecorGetBool(PedHandler, "ZombieLoot") then
                local Ground, Zpos = GetGroundZFor_3dCoord_2(PedCoords.x, PedCoords.y, PedCoords.z, false)
                Utils.DrawText3D(Translate("Plague:Loot"),PedCoords.x, PedCoords.y, Zpos + 0.2, 0.5, 4)
                if (IsControlJustPressed(0, 289)) and not Player.Dead() then
                    ClearPedTasksImmediately(PlayerPedId())
                    RequestAnimDict("amb@medic@standing@kneel@base")
                    while not HasAnimDictLoaded("amb@medic@standing@kneel@base") do
                        Wait(0)
                    end
                    TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base", "base", 5.0, 10.0, -1, 1, 0, false, false, false)

                    SendNUIMessage({
                        Type = "UpdateLoot",
                        Display = true,
                        Ped = PedHandler,
                        Inventory = Inventory.Loot[PedHandler]
                    })

                end
            end
        end

        Success, PedHandler = FindNextPed(Handler)
    until not (Success)

    EndFindPed(Handler)
end)
--]]