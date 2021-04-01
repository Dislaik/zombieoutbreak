local Utils = M("Utils")

DecorRegister("PLAYER", 2)
DecorRegister("PLAYER_LOADED", 2)
DecorRegister("PLAYER_SHOOTING", 2)
DecorRegister("PLAYER_RUNNING", 2)
DecorRegister("PLAYER_DRIVING", 2)
DecorRegister("PLAYER_DEAD", 2)
DecorRegister("PLAYER_ZOMBIFIED", 2)

local OnControlPressed

RegisterCommand("test", function(source, args, rawCommand)
    --print(Player:getPlayer():Loaded())
    print(Module.loaded(true))
end, false)


exports.spawnmanager:spawnPlayer({
    x = Module.Config.FirstSpawn.X,
    y = Module.Config.FirstSpawn.Y,
    z = Module.Config.FirstSpawn.Z,
    heading = Module.Config.FirstSpawn.Heading,
    model = "mp_m_freemode_01",
    skipFade = true
}, function()            

    --[[DecorSetBool(PlayerPed, "PLAYER", true)
    DecorSetBool(PlayerPed, "PLAYER_LOADED", false)
    DecorSetBool(PlayerPed, "PLAYER_SHOOTING", false)
    DecorSetBool(PlayerPed, "PLAYER_RUNNING", false)
    DecorSetBool(PlayerPed, "PLAYER_DRIVING", false)
    DecorSetBool(PlayerPed, "PLAYER_DEAD", false)
    DecorSetBool(PlayerPed, "PLAYER_ZOMBIFIED", false)--]]

    --TriggerServerEvent("Player:Instance")
    DisplayRadar(true)
    DoScreenFadeOut(0)

    TriggerServerEvent("Player:Spawned")
    SetCanAttackFriendly(PlayerPedId(), true, false)
    NetworkSetFriendlyFireOption(true)

    SetInterval(60000, function()
        if Module:getPlayer():loaded() then
            local playerCoords = GetEntityCoords(PlayerPedId(), true)
            TriggerServerEvent("Player:SetPositionData", playerCoords)
        end
    end)
end)

SetInterval(0, function()
    --SetPlayerHealthRechargeLimit(PlayerId(), 50)
    SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
    --print(GetPlayerHealthRechargeLimit(PlayerId()))
end)

--[[
SetInterval(0, function()
    for _, PlayerIndex in pairs(GetActivePlayers()) do
        local PlayerId = GetPlayerFromServerId(PlayerIndex)
        local PlayerPed = GetPlayerPed(PlayerId)
        
        if not DecorExistOn(PlayerPed, "PLAYER") then
            DecorSetBool(PlayerPed, "PLAYER", true)
            DecorSetBool(PlayerPed, "PLAYER_LOADED", false)
            DecorSetBool(PlayerPed, "PLAYER_INTERACT", false)
            DecorSetBool(PlayerPed, "PLAYER_SHOOTING", false)
            DecorSetBool(PlayerPed, "PLAYER_RUNNING", false)
            DecorSetBool(PlayerPed, "PLAYER_DRIVING", false)
            DecorSetBool(PlayerPed, "PLAYER_DEAD", false)
            DecorSetBool(PlayerPed, "PLAYER_ZOMBIFIED", false)
        end
    end
end)--]]


SetInterval(0, function()
    for _, PlayerIndex in pairs(GetActivePlayers()) do
        local PlayerId = GetPlayerFromServerId(PlayerIndex)
        local PlayerPed = GetPlayerPed(PlayerId)
        
        if DecorExistOn(PlayerPed, "PLAYER_SHOOTING") then
            if IsPedShooting(PlayerPed) then
                DecorSetBool(PlayerPed, "PLAYER_SHOOTING", true)
            
                Wait(5000)
            
                DecorSetBool(PlayerPed, "PLAYER_SHOOTING", false)
            end
        end
    end
end)

SetInterval(0, function()
    for _, PlayerIndex in pairs(GetActivePlayers()) do
        local PlayerId = GetPlayerFromServerId(PlayerIndex)
        local PlayerPed = GetPlayerPed(PlayerId)
        
        if DecorExistOn(PlayerPed, "PLAYER_RUNNING") then
            if IsPedSprinting(PlayerPed) or IsPedRunning(PlayerPed) then
                if not DecorGetBool(PlayerPed, "PLAYER_RUNNING") then
                    DecorSetBool(PlayerPed, "PLAYER_RUNNING", true)
                end
            else
                if DecorGetBool(PlayerPed, "PLAYER_RUNNING") then
                    DecorSetBool(PlayerPed, "PLAYER_RUNNING", false)
                end
            end
        end

        if DecorExistOn(PlayerPed, "PLAYER_DRIVING") then
            if IsPedInAnyVehicle(PlayerPed, false) then
                local Vehicle = GetVehiclePedIsIn(PlayerPed, false)
                if GetEntitySpeed(Vehicle) > 0.0 then
                    if not DecorGetBool(PlayerPed, "PLAYER_DRIVING") then
                        DecorSetBool(PlayerPed, "PLAYER_DRIVING", true)
                    end
                else
                    if DecorGetBool(PlayerPed, "PLAYER_DRIVING") then
                        DecorSetBool(PlayerPed, "PLAYER_DRIVING", false)
                    end
                end
            else
                if DecorGetBool(PlayerPed, "PLAYER_DRIVING") then
                    DecorSetBool(PlayerPed, "PLAYER_DRIVING", false)
                end
            end
        end
        
    end
end)


PlayerDeath = function(Killer, Weapon)
    print(Killer)
    local PlayerCoords = GetEntityCoords(PlayerPedId(), false)
    
    local Data = {}
    Data.PlayerCoords = PlayerCoords
    Data.Weapon = Weapon

    TriggerEvent("Player:DeathDetection", Data)
    TriggerServerEvent("Player:DeathDetection", Data)
end

PlayerDeathByPlayer = function(KillerId, Weapon)
    local PlayerCoords = GetEntityCoords(PlayerPedId(), false)
    local KillerCoords = GetEntityCoords(GetPlayerPed(KillerId), false)

    local Data = {}
    Data.PlayerCoords = PlayerCoords
    Data.KillerCoords = KillerCoords
    Data.KillerId = GetPlayerServerId(Killer)
    Data.Weapon = Weapon

    TriggerEvent("Player:DeathDetection", Data)
    TriggerServerEvent("Player:DeathDetection", Data)
end

SetInterval(0, function() 
    if NetworkIsPlayerActive(PlayerId()) then
        if IsPedFatallyInjured(PlayerPedId()) and not Module:getPlayer():isDead() then
            local Killer = GetPedSourceOfDeath(PlayerPedId())
            local Weapon = GetPedCauseOfDeath(PlayerPedId())
            local KillerId = NetworkGetPlayerIndexFromPed(Killer)

            if Killer ~= PlayerPedId() and NetworkIsPlayerActive(KillerId) then
                PlayerDeathByPlayer(KillerId, Weapon)
            else
                PlayerDeath(Killer, Weapon)
            end

            Module:getPlayer():isDead(true)
        elseif not IsPedFatallyInjured(PlayerPedId()) then
            Module:getPlayer():isDead(false)
        end
    end

    --[[if Dead then

        if IsControlPressed(0, 38) then

            OnControlPressed = OnControlPressed + 1
            if OnControlPressed > 30 then
                TriggerServerEvent("Player:Reset")
                Skin.ClearClothes()
                DoScreenFadeOut(1000)
                Wait(2000)
                NetworkResurrectLocalPlayer(Module.Config.PlayerRespawn.X, Module.Config.PlayerRespawn.Y, Module.Config.PlayerRespawn.Z, Module.Config.PlayerRespawn.Heading, true, false)
                ClearPedBloodDamage(PlayerPedId())
                AnimpostfxStop("DeathFailOut")
                DoScreenFadeIn(1000)
                PlaySoundFrontend(-1, "Hit", "RESPAWN_ONLINE_SOUNDSET", true)
            end
        else
            OnControlPressed = 0
        end

        Utils.DrawText("You are dead\nHold down E for respawn", 0.5, 0.5, 0.5, 2, 0, 255, 255, 255, 255, true)
    end--]]
end)