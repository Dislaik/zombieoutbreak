RegisterEvent("Admin:GiveVehicle", function(vehicleName)

    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Wait(0)
    end

    local playerCoords = GetEntityCoords(PlayerPedId(), true)
    local playerHeading = GetEntityHeading(PlayerPedId())
    local vehicle = CreateVehicle(vehicleName, playerCoords.x, playerCoords.y, playerCoords.z, playerHeading, true, true)
    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
end)

RegisterEvent("Admin:Revive", function()
    local playerCoords = GetEntityCoords(PlayerPedId())
    local playerHeading = GetEntityHeading(PlayerPedId())

    DoScreenFadeOut(1000)

    while not IsScreenFadedOut() do
		Citizen.Wait(50)
    end

    SetEntityCoordsNoOffset(PlayerPedId(), playerCoords.x, playerCoords.y, playerCoords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(playerCoords.x, playerCoords.y, playerCoords.z, playerHeading, true, false)
	SetPlayerInvincible(PlayerPedId(), false)
	ClearPedBloodDamage(PlayerPedId())
	PlaySoundFrontend(-1, "Hit", "RESPAWN_ONLINE_SOUNDSET", 1)
    
    StopScreenEffect('DeathFailOut')
	DoScreenFadeIn(1000)

end)