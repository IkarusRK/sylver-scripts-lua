-- ===========================
--  Sylver Notify
--  Uso: exports['sylver_notify']:Notify('Mensagem', 'success', 3000)
--  Tipos: success | error | info | warning
-- ===========================

exports('Notify', function(msg, notifyType, duration)
    notifyType = notifyType or 'info'
    duration   = duration   or 3000

    SendNUIMessage({
        type     = 'NOTIFY',
        message  = msg,
        style    = notifyType,
        duration = duration
    })
end)

-- =====================
--  Alias para compat. com outros resources
-- =====================
exports('ShowNotification', function(msg)
    exports['sylver_notify']:Notify(msg, 'info', 3000)
end)
