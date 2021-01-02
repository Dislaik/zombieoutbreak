RegisterNetEvent("Admin:GiveVehicle")
AddEventHandler("Admin:GiveVehicle", function(VehicleName)
    RequestModel(VehicleName)
    while not HasModelLoaded(VehicleName) do
        Wait(0)
    end
    local PlayerCoords = GetEntityCoords(PlayerPedId(), true)
    local PlayerHeading = GetEntityHeading(PlayerPedId())
    local Vehicle = CreateVehicle(VehicleName, PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, PlayerHeading, true, true)
    TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
end)

RegisterNetEvent("Admin:Revive")
AddEventHandler("Admin:Revive", function(VehicleName)
    local PlayerCoords = GetEntityCoords(PlayerPedId())
    local PlayerHeading = GetEntityHeading(PlayerPedId())
    DoScreenFadeOut(1000)

    while not IsScreenFadedOut() do
		Citizen.Wait(50)
    end

    SetEntityCoordsNoOffset(PlayerPedId(), PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, PlayerHeading, true, false)
	SetPlayerInvincible(PlayerPedId(), false)
	ClearPedBloodDamage(PlayerPedId())
	PlaySoundFrontend(-1, "Hit", "RESPAWN_ONLINE_SOUNDSET", 1)
    
    StopScreenEffect('DeathFailOut')
	DoScreenFadeIn(1000)
end)