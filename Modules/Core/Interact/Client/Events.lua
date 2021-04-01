local Utils = M("Utils")

RegisterNUICallback("Interact:PLAYER_SLEEP", function(data)
    local playerCoords = GetEntityCoords(PlayerPedId())
    local sleepTimer = 1000 * 30
    local wakeUp = false
    local sleepPoses = {
        {animDict = "savebighouse@", animName = "f_sleep_l_loop_bighouse"},
        {animDict = "savebighouse@", animName = "f_sleep_r_loop_bighouse"},
        --{animDict = "savecouch@", animName = "t_sleep_loop_couch"}, --sofa
        --{animDict = "savecountryside@", animName = "m_sleep_loop_countryside"}, --sofa
        --{animDict = "savecountryside@", animName = "t_sleep_loop_countryside"}, --sofa
        {animDict = "savef_default@", animName = "f_sleep_r_loop"},
        {animDict = "saveveniceb@", animName = "t_sleep_l_loop_veniceb"}
        --{animDict = "switch@franklin@bed", animName = "sleep_getup_rubeyes"} --wakup
    }
    local anim = sleepPoses[Utils.Random(1, #sleepPoses)]

    SetInterval(0, function(id)
        DisableControlAction(0, 19)

        if wakeUp then
            ClearInterval(id)
        end
    end)

    FreezeEntityPosition(PlayerPedId(), true)
    SetEntityCoords(PlayerPedId(), playerCoords.x, playerCoords.y, playerCoords.z - 1.6)
    Utils.PlayAnim(PlayerPedId(), anim.animDict, anim.animName, 1.0, 5.0, sleepTimer - 1500, 1, 0, 0, 0, 0)

    SendNUIMessage({
        type = "INTERACT_SLEEP",
        display = true,
        timer = sleepTimer
    })

    Wait(sleepTimer)
    SetEntityCoords(PlayerPedId(), playerCoords.x, playerCoords.y, playerCoords.z - 0.8)
    FreezeEntityPosition(PlayerPedId(), false)
    --AnimpostfxStop("MenuMGHeistOut")
    --DoScreenFadeIn(1000)
    wakeUp = true
    SendNUIMessage({
        type = "Interact_Sleep",
        display = false
    })
end)

RegisterNUICallback("Interact:PLAYER_SIT", function(data)
    local sitPoses = {
        --{animDict = "amb@code_human_in_bus_passenger_idles@female@sit@base", animName = "base"}
        --{animDict = "amb@world_human_sit_ups@male@base", animName = "base"} --aBDOMINALES
        --{animDict = "amb@world_human_sit_ups@male@enter", animName = "enter"} --aBDOMINALES enter
        --{animDict = "amb@world_human_sit_ups@male@exit", animName = "exit"} --aBDOMINALES exit
        --{animDict = "amb@world_human_sit_ups@male@idle_a", animName = "idle_a"} abdominales a
        --{animDict = "amb@world_human_sit_ups@male@idle_a", animName = "idle_b"}  abdominales b
        --{animDict = "amb@world_human_sit_ups@male@idle_a", animName = "idle_c"}  --abdominales c
        {animDict = "anim@amb@business@bgen@bgen_no_work@", animName = "sit_phone_phoneputdown_idle_nowork"},
        {animDict = "rcm_barry3", animName = "barry_3_sit_loop"},
        {animDict = "amb@world_human_picnic@male@idle_a", animName = "idle_a"}
    }
    local anim = sitPoses[Utils.Random(1, #sitPoses)]

    SetInterval(0, function(id)
        DisableControlAction(0, 19)
        for i = 32, 35 do
            if IsControlJustPressed(0, i) then
                ClearPedTasks(PlayerPedId())
                ClearInterval(id)
            end
        end
    end)

    Utils.PlayAnim(PlayerPedId(), anim.animDict, anim.animName, 2.0, 2.0, -1, 1, 0, 0, 0, 0)
end)


RegisterNUICallback("Interact:ENTER_VEHICLE", function(data)
    local vehicle = data.entity

    TaskEnterVehicle(PlayerPedId(), vehicle, 5.0, -1, 1.0, 1, 0)
end)

RegisterNUICallback("Interact:OPEN_DOOR_DRIVER", function(data)
    local vehicle = data.entity

    if GetVehicleDoorAngleRatio(vehicle, 0) > 0 then
        SetVehicleDoorShut(vehicle, 0, false)
    else
        SetVehicleDoorOpen(vehicle, 0, false, false)
    end
end)