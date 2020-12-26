LoadModuleTranslations("Data/Locales/" .. "EN" .. ".lua")
local Config = LoadModuleConfig("Data/Config.lua")
Load("Client/Events.lua")
Player = {}
Player.Loaded = false
Player.Dead = false

local OnControlPressed

exports.spawnmanager:spawnPlayer({
    x = Config.FirstSpawn.X,
    y = Config.FirstSpawn.Y,
    z = Config.FirstSpawn.Z,
    heading = Config.FirstSpawn.Heading,
    model = "mp_m_freemode_01",
    skipFade = true
    }, function()
        
        DoScreenFadeOut(0)
        TriggerServerEvent("Player:Spawned")
        SetCanAttackFriendly(PlayerPedId(), true, false)
        NetworkSetFriendlyFireOption(true)

        SetInterval(60000, function()
            if Player.Loaded then
                local PlayerCoords = GetEntityCoords(PlayerPedId(), true)
                TriggerServerEvent("Player:Position", PlayerCoords)
            end
        end)
end)

Player.ShowNotification = function(Message)
    SetNotificationTextEntry('STRING')
	AddTextComponentString(Message)
	DrawNotification(0,1)
end

SetInterval(0, function() 
    if NetworkIsPlayerActive(PlayerId()) then
        if IsPedFatallyInjured(PlayerPedId()) and not Player.Dead then
            Player.Dead = true
            local Killer = GetPedSourceOfDeath(PlayerPedId())
            local Weapon = GetPedCauseOfDeath(PlayerPedId())
            local KillerId = NetworkGetPlayerIndexFromPed(Killer)

            if Killer ~= PlayerPedId() and NetworkIsPlayerActive(KillerId) then
                Player.PlayerDeathByPlayer(KillerId, Weapon)
            else
                Player.PlayerDeath(Weapon)
            end
        elseif not IsPedFatallyInjured(PlayerPedId()) then
            Player.Dead = false
        end
    end

    if Player.Dead then
        if IsControlPressed(0, 38) then
            OnControlPressed = OnControlPressed + 1
            if OnControlPressed > 30 then
                TriggerServerEvent("Player:Reset")
                Skin.ClearClothes()
                DoScreenFadeOut(1000)
                Wait(2000)
                NetworkResurrectLocalPlayer(Config.PlayerRespawn.X, Config.PlayerRespawn.Y, Config.PlayerRespawn.Z, Config.PlayerRespawn.Heading, true, false)
                ClearPedBloodDamage(PlayerPedId())
                AnimpostfxStop("DeathFailOut")
                DoScreenFadeIn(1000)
                PlaySoundFrontend(-1, "Hit", "RESPAWN_ONLINE_SOUNDSET", true)
            end
        else
            OnControlPressed = 0
        end

        Utils.DrawText("You are dead\nHold down E for respawn", 0.5, 0.5, 0.5, 2, 0, 255, 255, 255, 255, true)
    end
end)

Player.PlayerDeath = function(Weapon)
    local PlayerCoords = GetEntityCoords(PlayerPedId(), false)
    
    local Data = {}
    Data.PlayerCoords = PlayerCoords
    Data.Weapon = Weapon

    TriggerEvent("Player:DeathDetection", Data)
    TriggerServerEvent("Player:DeathDetection", Data)
end

Player.PlayerDeathByPlayer = function(KillerId, Weapon)
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