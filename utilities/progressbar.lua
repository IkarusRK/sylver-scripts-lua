-- ===========================
--  Sylver ProgressBar
--  Uso: exports['sylver_utils']:ProgressBar(duracao, label, cb)
-- ===========================

local isRunning = false

exports('ProgressBar', function(duration, label, onComplete)
    if isRunning then return end
    isRunning = true

    SendNUIMessage({
        type     = 'START_PROGRESS',
        label    = label,
        duration = duration
    })

    -- Animacao de acao
    local dict = 'amb@world_human_stand_mobile@male@base'
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(10) end
    TaskPlayAnim(PlayerPedId(), dict, 'base', 8.0, -8.0, duration, 49, 0, false, false, false)

    Wait(duration)

    ClearPedTasks(PlayerPedId())
    SendNUIMessage({ type = 'END_PROGRESS' })
    isRunning = false

    if onComplete then onComplete() end
end)

exports('CancelProgress', function()
    if not isRunning then return end
    isRunning = false
    ClearPedTasks(PlayerPedId())
    SendNUIMessage({ type = 'END_PROGRESS' })
end)
