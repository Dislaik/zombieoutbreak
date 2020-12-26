local Config = LoadModuleConfig("Data/Config.lua")

local PlayerGroup, ZombieGroup = "PLAYER", "ZOMBIE"
--local SetPedTestStorage = {}

local ZombieGrunt = {
	"zombie2",
	"zombie3",
	"zombie4",
    "zombie5",
    "zombie6",
	"zombie8",
	"zombie9",
    "zombie11",
	"zombie12",
	"zombie13",
	"zombie14",
    "zombie16",
	"zombie17",
	"zombie18",
	"zombie19",
	"zombie20"
}

local ZombieGruntAlert = {
    "zombie1",
    "zombie7",
    "zombie10",
    "zombie15"
}

AddRelationshipGroup(ZombieGroup)
SetRelationshipBetweenGroups(0, GetHashKey(ZombieGroup), GetHashKey(PlayerGroup))
SetRelationshipBetweenGroups(5, GetHashKey(PlayerGroup), GetHashKey(ZombieGroup))

SetInterval(10, function()
    local PedHandler = -1
    local Success = false
    local Handler, PedHandler = FindFirstPed()

    repeat
        Wait(10)
            
        if IsPedHuman(PedHandler) and not IsPedAPlayer(PedHandler) and not IsPedDeadOrDying(PedHandler, true) then
            if (GetRelationshipBetweenPeds(PedHandler, PlayerPedId()) ~= 0) then
                ClearPedTasks(PedHandler)
                ClearPedSecondaryTask(PedHandler)
                ClearPedTasksImmediately(PedHandler)
                TaskWanderStandard(PedHandler, 10.0, 10)
                SetPedRelationshipGroupHash(PedHandler, ZombieGroup)
                ApplyPedDamagePack(PedHandler, "BigHitByVehicle", 0.0, 1.0)
                SetEntityHealth(PedHandler, Config.ZombieHealth)

                RequestAnimSet("move_m@drunk@verydrunk")
                while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
                    Wait(0)
                end
                SetPedMovementClipset(PedHandler, "move_m@drunk@verydrunk", 1.0)

                SetPedConfigFlag(PedHandler, 100, false)
                --PedHandler.Test = "Test Added to ped"
            end

            local PlayerCoords = GetEntityCoords(PlayerPedId())
            local PedCoords = GetEntityCoords(PedHandler)
            local Distance = Vdist(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, PedCoords.x, PedCoords.y, PedCoords.z)

            if Config.ZombieSound and ((Distance <= Config.ZombieDistanceTargetToPlayer) and (Utils.Random(1, 50) == 1)) then
                local Grunt = ZombieGrunt[Utils.Random(1, #ZombieGrunt)]
                Utils.IndividualSoundEntity("Core", "Plague", Grunt, 0.5, PedHandler, false)
            end

            if not NetworkGetEntityIsNetworked(PedHandler) then
                PedHandler = DeletePed()
            end

            ZombiePedAttributes(PedHandler)
                
            if (Config.Debug) then
                DrawMarker(1, PedCoords.x, PedCoords.y, PedCoords.z+1, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 255, 255, 255, false, true, 2, nil, nil, false)
            end
        end

        Success, PedHandler = FindNextPed(Handler)
    until not (Success)

    EndFindPed(Handler)
end)

SetInterval(1000, function()
    local PedHandler = -1
    local Success = false
    local Handler, PedHandler = FindFirstPed()

    repeat
        Wait(10)
            
        if IsPedHuman(PedHandler) and not IsPedAPlayer(PedHandler) and not IsPedDeadOrDying(PedHandler, true) then

            local PlayerCoords = GetEntityCoords(PlayerPedId())
            local PedCoords = GetEntityCoords(PedHandler)
            local Distance = Vdist(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, PedCoords.x, PedCoords.y, PedCoords.z)
            --TaskGoStraightToCoord(PedHandler, PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, 2.0, -1, 20, 20)
            if Distance <= Config.ZombieDistanceTargetToPlayer and not GetPedConfigFlag(PedHandler, 100, false) and GetEntityHealth(PlayerPedId()) ~= 0 then
                local GruntAlert = ZombieGruntAlert[Utils.Random(1, #ZombieGruntAlert)]
                SetPedConfigFlag(PedHandler, 100, true)
                ClearPedTasks(PedHandler)
                if Config.ZombieSound then
                    Utils.IndividualSoundEntity("Core", "Plague", GruntAlert, 0.8, PedHandler, false)
                end
                if (Config.ZombieCanRun) then
                    TaskGoToEntity(PedHandler, PlayerPedId(), -1, 0.0, 2.0, 1073741824, 0)
                else
                    TaskGoToEntity(PedHandler, PlayerPedId(), -1, 0.0, 1.0, 1073741824, 0)
                end
            end
            --if (Distance <= Config.ZombieDistanceTargetToPlayer and IsPedStopped(PedHandler)) then
            --    TaskGoStraightToCoord(PedHandler, PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, 2.0, -1, 20, 20)
            --end

            if (Distance <= 1.3) then
                if not IsPedRagdoll(PedHandler) and not IsPedGettingUp(PedHandler) then
                    if (GetEntityHealth(PlayerPedId()) == 0) then
                        ClearPedTasks(PedHandler)
                        TaskWanderStandard(PedHandler, 10.0, 10)
                        SetPedConfigFlag(PedHandler, 100, false)
                    else
                        RequestAnimSet("melee@unarmed@streamed_core_fps")
                        while not HasAnimSetLoaded("melee@unarmed@streamed_core_fps") do
                            Wait(10)
                        end

                        TaskPlayAnim(PedHandler, "melee@unarmed@streamed_core_fps", "ground_attack_0_psycho", 8.0, 1.0, -1, 48, 0.001, false, false, false)
                        ApplyDamageToPed(PlayerPedId(), Config.ZombieDamage, false)
                    end
                end
            end

            if (Config.Debug) then
                DrawMarker(1, PedCoords.x, PedCoords.y, PedCoords.z+1, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 0, 0, 255, false, true, 2, nil, nil, false)
            end
        end

        Success, PedHandler = FindNextPed(Handler)
    until not (Success)

    EndFindPed(Handler)
end)

function ZombiePedAttributes(Ped)
    if not Config.ZombieCanRagdollByShots then SetPedRagdollBlockingFlags(Ped, 1) end
    SetPedCanRagdollFromPlayerImpact(Ped, false)
    SetPedSuffersCriticalHits(Ped, Config.ZombieInstantDeathByHeadshot)
    SetPedEnableWeaponBlocking(Ped, true)
    DisablePedPainAudio(Ped, true)
    StopPedSpeaking(Ped, true)
    SetPedDiesWhenInjured(Ped, false)
    StopPedRingtone(Ped)
    SetPedMute(Ped)
    SetPedIsDrunk(Ped, true)
    SetPedConfigFlag(Ped, 166, false)
    SetPedConfigFlag(Ped, 170, false)
    SetBlockingOfNonTemporaryEvents(Ped, true)
    SetPedCanEvasiveDive(Ped, false)
    RemoveAllPedWeapons(Ped, true)
end
--[[
local SetPedStorageProperties = function(Ped, Bool)
    local PedArray = tostring(Ped)
    PedArray = {}
    PedArray.ID = Ped
    PedArray.Bool = Bool
    table.insert(SetPedTestStorage, PedArray)
end]]