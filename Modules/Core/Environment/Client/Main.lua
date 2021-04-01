local Utils = M("Utils")

DecorRegister("VEHICLE_STOPPED", 2)

SetArtificialLightsState(true)
StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
SetDistantCarsEnabled(true)
SetFarDrawVehicles(true)
SetMaxWantedLevel(0)
NetworkOverrideClockTime(NetworkGetServerTime())
SetAudioFlag("DisableFlightMusic", true)
SetAudioFlag("PoliceScannerDisabled", true)

local RadioStationScenary = {
    "RADIO_01_CLASS_ROCK",
    "RADIO_02_POP",
    "RADIO_03_HIPHOP_NEW",
    "RADIO_04_PUNK",
    "RADIO_05_TALK_01",
    "RADIO_06_COUNTRY",
    "RADIO_07_DANCE_01",
    "RADIO_08_MEXICAN",
    "RADIO_09_HIPHOP_OLD",
    "RADIO_11_TALK_02",
    "RADIO_12_REGGAE",
    "RADIO_13_JAZZ",
    "RADIO_14_DANCE_02",
    "RADIO_15_MOTOWN",
    "RADIO_16_SILVERLAKE",
    "RADIO_17_FUNK",
    "RADIO_18_90S_ROCK",
    "RADIO_19_USE",
    "RADIO_20_THELAB",
    "RADIO_21_DLC_XM17",
    "RADIO_22_DLC_BATTLE_MIX1_RADIO",
    "HIDDEN_RADIO_AMBIENT_TV",
    "HIDDEN_RADIO_AMBIENT_TV_BRIGHT",
    "HIDDEN_RADIO_01_CLASS_ROCK",
    "HIDDEN_RADIO_ADVERTS",
    "HIDDEN_RADIO_02_POP",
    "HIDDEN_RADIO_03_HIPHOP_NEW",
    "HIDDEN_RADIO_04_PUNK",
    "HIDDEN_RADIO_06_COUNTRY",
    "HIDDEN_RADIO_07_DANCE_01",
    "HIDDEN_RADIO_09_HIPHOP_OLD",
    "HIDDEN_RADIO_12_REGGAE",
    "HIDDEN_RADIO_15_MOTOWN",
    "HIDDEN_RADIO_16_SILVERLAKE",
    "RADIO_22_DLC_BATTLE_MIX1_CLUB",
    "HIDDEN_RADIO_STRIP_CLUB",
    "DLC_BATTLE_MIX1_CLUB_PRIV",
    "HIDDEN_RADIO_BIKER_CLASSIC_ROCK",
    "DLC_BATTLE_MIX2_CLUB_PRIV",
    "HIDDEN_RADIO_BIKER_MODERN_ROCK",
    "RADIO_23_DLC_BATTLE_MIX2_CLUB",
    "RADIO_25_DLC_BATTLE_MIX4_CLUB",
    "DLC_BATTLE_MIX3_CLUB_PRIV",
    "RADIO_26_DLC_BATTLE_CLUB_WARMUP",
    "HIDDEN_RADIO_BIKER_PUNK",
    "RADIO_24_DLC_BATTLE_MIX3_CLUB",
    "DLC_BATTLE_MIX4_CLUB_PRIV",
    "HIDDEN_RADIO_BIKER_HIP_HOP"
}

for _ in pairs(RadioStationScenary) do
    SetRadioStationDisabled(RadioStationScenary[_], true)
end

for i, zone in pairs(Module.Config.SafeZones) do
    blip = AddBlipForRadius(zone.x, zone.y, zone.z, zone.radius)
	SetBlipHighDetail(blip, true)
    SetBlipColour(blip, 2)
    SetBlipAlpha(blip, 128)
end

for i = 0, 15 do
    EnableDispatchService(i, false)
end
--[[
SetInterval(0, function()
    local PedHandler = -1
    local Success = false
    local Handler, PedHandler = FindFirstPed()

    repeat
        Wait(0)
        
        if IsPedHuman(PedHandler) and not IsPedAPlayer(PedHandler) then
            if IsPedInAnyHeli(PedHandler) or IsPedInAnyPlane(PedHandler) then
                local VehiclePedHandler = GetVehiclePedIsIn(PedHandler, true)
                DeleteEntity(VehiclePedHandler)
            elseif IsPedInAnyVehicle(PedHandler, true) then
                SetEntityAlwaysPrerender(PedHandler, true)
                N_0xf9acf4a08098ea25(PedHandler, false)
                DeleteEntity(PedHandler)
            end
        end

        Success, PedHandler = FindNextPed(Handler)
    until not (Success)

    EndFindPed(Handler)
end)--]]


SetInterval(0, function()
    local VehicleHandler = -1
    local Success
    local Handler, VehicleHandler = FindFirstVehicle()

    repeat

        if not DecorExistOn(VehicleHandler, "VEHICLE_STOPPED") then  
            BringVehicleToHalt(VehicleHandler, 0, 1, false)
            DecorSetBool(VehicleHandler, "VEHICLE_STOPPED", false)
                
            if Module.Config.Debug then
                local VehicleCoords = GetEntityCoords(VehicleHandler)
                DrawMarker(1, VehicleCoords.x, VehicleCoords.y, VehicleCoords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 4.0, 4.0, 2.0, 255, 0, 0, 255, false, true, 2, nil, nil, false)
            end
        end

        Success, VehicleHandler = FindNextVehicle(Handler)
    until not (Success)

    EndFindPed(Handler)
end)


SetInterval(0, function()
    local VehicleHandler = -1
    local Success
    local Handler, VehicleHandler = FindFirstVehicle()

    repeat
        Wait(0)

        if DecorExistOn(VehicleHandler, "VEHICLE_STOPPED") then
            if IsPedInVehicle(PlayerPedId(), VehicleHandler, true) and not DecorGetBool(VehicleHandler, "VEHICLE_STOPPED") then
                DecorSetBool(VehicleHandler, "VEHICLE_STOPPED", true)
            elseif not IsPedInVehicle(PlayerPedId(), VehicleHandler, true) and not DecorGetBool(VehicleHandler, "VEHICLE_STOPPED") then
                BringVehicleToHalt(VehicleHandler, 0, 1, false)
                if GetIsVehicleEngineRunning(VehicleHandler) then
                    SetVehicleEngineOn(VehicleHandler, false, false, false)
                end
            end
        end

        Success, VehicleHandler = FindNextVehicle(Handler)
    until not (Success)

    EndFindPed(Handler)
end)



SetInterval(0, function()
    --SetPedDensityMultiplierThisFrame()
    DisablePlayerVehicleRewards(PlayerId())
    DisableOcclusionThisFrame()

    for _, Interior in pairs(Module.Config.InteriorLights) do
        DrawLightWithRange(Interior.X, Interior.Y, Interior.Z, Interior.R, Interior.G, Interior.B, Interior.Range, Interior.Intensity)
    end
    SetAmbientVehicleRangeMultiplierThisFrame(1.0)
    SetParkedVehicleDensityMultiplierThisFrame(1.0)
end)

--[[
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
--]]