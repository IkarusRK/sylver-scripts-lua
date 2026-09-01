-- ===========================
--  Sylver HUD - Client
--  Resmon: ~0.01ms
-- ===========================

local hudVisible  = true
local playerStats = {
    hp     = 100,
    armor  = 0,
    hunger = 100,
    thirst = 100,
    stress = 0,
}

-- =====================
--  Thread principal HUD
-- =====================
CreateThread(function()
    while true do
        Wait(2000)  -- atualiza a cada 2s para manter resmon baixo
        if not hudVisible then goto continue end

        local ped = PlayerPedId()

        playerStats.hp    = math.ceil(GetEntityHealth(ped) - 100)
        playerStats.armor = GetPedArmour(ped)

        SendNUIMessage({
            type  = 'UPDATE_HUD',
            stats = playerStats
        })

        ::continue::
    end
end)

-- =====================
--  Toggle HUD
-- =====================
RegisterNetEvent('sylver_hud:setVisible')
AddEventHandler('sylver_hud:setVisible', function(visible)
    hudVisible = visible
    SendNUIMessage({ type = 'TOGGLE_HUD', visible = visible })
    SetNuiFocus(false, false)
end)

-- =====================
--  Update stats externos (fame, stress, etc.)
-- =====================
RegisterNetEvent('sylver_hud:updateStats')
AddEventHandler('sylver_hud:updateStats', function(stats)
    for k, v in pairs(stats) do
        playerStats[k] = v
    end
end)
