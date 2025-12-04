local display = false
local lastNotificationTime = 0

-- Load reminder interval from config
local notificationInterval = Config.Interval or (60 * 60 * 1000)

-- When player spawns, show first notification
AddEventHandler('playerSpawned', function()
    lastNotificationTime = GetGameTimer()
    ToggleUI(true)
end)

-- Toggle NUI display
function ToggleUI(state)
    display = state

    SendNUIMessage({
        type = "ui",
        status = display,
        title = Config.Title,
        message = Config.Message,
        closeKey = Config.CloseKey,
        closeText = Config.CloseText
    })
end

-- Reminder interval check
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(30 * 60 * 1000)

        local currentTime = GetGameTimer()
        local diff = currentTime - lastNotificationTime

        if diff >= notificationInterval then
            lastNotificationTime = currentTime
            ToggleUI(true)
        end
    end
end)

-- Block ESC while UI is open
Citizen.CreateThread(function()
    while true do
        if display then
            Citizen.Wait(0)

            DisableControlAction(0, 200, true)
            DisableControlAction(0, 199, true)
            SetPauseMenuActive(false)

            if IsDisabledControlJustReleased(0, 200) then
                ToggleUI(false)
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

-- NUI close callback
RegisterNUICallback('close', function(data, cb)
    ToggleUI(false)
    cb('ok')
end)

-- Test command
RegisterCommand('testreminder', function()
    lastNotificationTime = GetGameTimer() - notificationInterval
    Citizen.Wait(100)
    ToggleUI(true)
end)
