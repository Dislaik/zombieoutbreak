Module.Translations = Load("Data/Locales/".. Config.Lang ..".lua")["Translations"]
Module.Config = Load("Data/Config.lua")["Config"]


Module.ResetAttributes = function(Ped)
    ClearPedTasksImmediately(Ped)
    ClearPedSecondaryTask(Ped)
    RemoveAllPedWeapons(Ped, true)
    SetPedCanPlayAmbientAnims(Ped, false)
end

Module.ZombieAttributes = function(Zombie)
    ApplyPedDamagePack(Zombie, "BigHitByVehicle", 0.0, 1.0)
    SetEntityHealth(Zombie, Module.Config.ZombieHealth)
    if not Module.Config.ZombieCanRagdollByShots then SetPedRagdollBlockingFlags(Zombie, 1) end
    SetPedCanRagdollFromPlayerImpact(Zombie, false)
    SetPedSuffersCriticalHits(Zombie, Module.Config.ZombieInstantDeathByHeadshot)
    DisablePedPainAudio(Zombie, true)
    SetPedDiesWhenInjured(Zombie, false)
    StopCurrentPlayingSpeech(Zombie)
    StopPedRingtone(Zombie)
    StopPedSpeaking(Zombie, true)
    SetBlockingOfNonTemporaryEvents(Zombie, true)
    SetPedCanEvasiveDive(Zombie, false)
    TaskWanderStandard(Zombie, 1.0, 1)
    SetPedPathCanDropFromHeight(Zombie, true) -- test
    SetPedPathCanUseClimbovers(Zombie, true) -- test
    SetPedPathCanUseLadders(Zombie, true) -- test
    SetPedPathMayEnterWater(Zombie, false) -- test
    SetPedCanPlayInjuredAnims(Zombie, false) -- test
    --SetRagdollBlockingFlags(Zombie, 4) --test
    --SetPedCanPlayVisemeAnims(Zombie, false, 0) --test
    --SetPedCanTorsoIk(Zombie, false) --test
    --SetPedCanUseAutoConversationLookat(Zombie, false) --test
    --TaskStopPhoneGestureAnimation(Zombie) -- test
    --SetPedCombatMovement(Zombie, 0) --test
    --SetPedCombatAbility(Zombie, 0) --test
    --SetPedConfigFlag() -- test
    --SetPedCanPlayGestureAnims(Zombie, false)
    --SetPedCanPlayAmbientBaseAnims(Zombie, false)
    --SetPedCanPlayAmbientAnims(Zombie, false)
    --SetPedCanBeDraggedOut(Zombie, true)
    --SetPedPathAvoidFire(Zombie, false)
    
end