local Config = LoadModuleConfig("Data/Config.lua")

SetArtificialLightsState(true)
StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
SetDistantCarsEnabled(true)
SetMaxWantedLevel(0)

local SpawnVehicleSuppressed = { "akula", "annihilator", "buzzard", "buzzard2", "cargobob", "cargobob2", "cargobob3", "cargobob4", "frogger", "frogger2",
    "havok", "hunter", "maverick", "savage", "seasparrow", "skylift", "supervolito", "supervolito2", "swift", "swift2", "valkyrie", "valkyrie2", "volatus",
    "annihilator2", "seasparrow2", "seasparrow3", "alphaz1", "avenger", "avenger2", "besra", "blimp", "blimp2", "blimp3", "bombushka", "cargoplane", "cuban800",
    "dodo", "duster", "howard", "hydra", "jet", "lazer", "luxor", "luxor2", "mammatus", "microlight", "miljet", "mogul", "molotok", "nimbus", "nokota", "pyro",
    "rogue", "seabreeze", "shamal", "starling", "strikeforce", "stunt", "titan", "tula", "velum", "velum2", "vestra", "volatol", "alkonost"
}

for i in pairs(SpawnVehicleSuppressed) do
    SetVehicleModelIsSuppressed(GetHashKey(SpawnVehicleSuppressed[i]), true)
end

for i, zone in pairs(Config.SafeZones) do
    blip = AddBlipForRadius(zone.x, zone.y, zone.z, zone.radius)
	SetBlipHighDetail(blip, true)
    SetBlipColour(blip, 2)
    SetBlipAlpha(blip, 128)
end

SetInterval(0, function()
    for i, Player in pairs(GetActivePlayers()) do

        local PlayerId = GetPlayerFromServerId(Player)
        local PlayerPed = GetPlayerPed(PlayerId)
        local VehicleHandler = -1
        local Success
        local Handler, VehicleHandler = FindFirstVehicle()

        repeat
            Wait(5)
            local VehicleCoords = GetEntityCoords(VehicleHandler)

            if (IsPedInVehicle(PlayerPed, VehicleHandler, true)) or (GetLastPedInVehicleSeat(VehicleHandler, -1) == PlayerPed) then
                SetVehRadioStation(VehicleHandler, "OFF")
                SetVehicleEngineOn(VehicleHandler, true, false, false)
            else

                if (Utils.Random(1, 100) <= Config.PercentageVehiclesUndriveable) and GetVehicleEngineHealth(VehicleHandler) > 999.0 then
                    SetVehicleIsConsideredByPlayer(VehicleHandler, false)
                    SetEntityRenderScorched(VehicleHandler, true)
                    SetVehicleEngineHealth(VehicleHandler, -4000.0)
                else
                    SetVehicleEngineHealth(VehicleHandler, 999.0)
                end

                if not (IsVehicleSeatFree(VehicleHandler, -1)) then
                    local PedHandler = GetPedInVehicleSeat(VehicleHandler, -1)
                    DeleteEntity(PedHandler)
                end

                SetVehicleEngineOn(VehicleHandler, false, true, true)
                BringVehicleToHalt(VehicleHandler, 0, 1, false)
            end
             
            if (Config.Debug) then
                DrawMarker(1, VehicleCoords.x, VehicleCoords.y, VehicleCoords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 4.0, 4.0, 2.0, 255, 255, 255, 255, false, true, 2, nil, nil, false)
            end

            Success, VehicleHandler = FindNextVehicle(Handler)
        until not (Success)

        EndFindPed(Handler)
    end
end)

SetInterval(0, function()
    for i, Interior in pairs(Config.InteriorLights) do
        DrawLightWithRange(Interior.X, Interior.Y, Interior.Z, Interior.R, Interior.G, Interior.B, Interior.Range, Interior.Intensity)
    end
end)

SetInterval(0, function()
    DisablePlayerVehicleRewards(PlayerId())
    for i=0,15 do
        EnableDispatchService(i, false)
    end
end)

SetInterval(0, function()
    for i, zone in pairs(Config.SafeZones) do
        local PedHandler = -1
        local Success = false
        local Handler, PedHandler = FindFirstPed()

        repeat
            if IsPedHuman(PedHandler) and not IsPedAPlayer(PedHandler) and not IsPedDeadOrDying(PedHandler, true) then
                local pedcoords = GetEntityCoords(PedHandler)
                local distance = Vdist(zone.x, zone.y, zone.z, pedcoords.x, pedcoords.y, pedcoords.z)

                if (distance <= zone.radius) then
                    DeleteEntity(PedHandler)
                end
            end

            Success, PedHandler = FindNextPed(Handler)
        until not (Success)

        EndFindPed(Handler)
    end
end)
