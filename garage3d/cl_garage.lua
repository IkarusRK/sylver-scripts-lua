-- ===========================
--  Sylver Garage 3D - Client
--  Resmon: ~0.02ms
-- ===========================

local garageOpen    = false
local nearbyGarage  = nil
local GARAGE_COORDS = vector3(-1045.0, -2226.0, 13.9)
local TRIGGER_DIST  = 5.0

-- =====================
--  Detectar proximidade (sem tick pesado)
-- =====================
CreateThread(function()
    while true do
        local sleep = 1000
        local ped   = PlayerPedId()
        local pos   = GetEntityCoords(ped)
        local dist  = #(pos - GARAGE_COORDS)

        if dist < TRIGGER_DIST then
            sleep = 0
            nearbyGarage = true
            DisplayHelpTextThisFrame('Pressione ~INPUT_CONTEXT~ para acessar a Garagem 3D')

            if IsControlJustReleased(0, 38) and not garageOpen then
                TriggerServerEvent('sylver_garage:requestCars')
            end
        else
            nearbyGarage = nil
        end

        Wait(sleep)
    end
end)

-- =====================
--  Abrir NUI da garagem
-- =====================
RegisterNetEvent('sylver_garage:openUI')
AddEventHandler('sylver_garage:openUI', function(cars)
    garageOpen = true
    SendNUIMessage({
        type = 'OPEN_GARAGE',
        cars = cars
    })
    SetNuiFocus(true, true)
end)

-- =====================
--  Spawnar veiculo selecionado
-- =====================
RegisterNUICallback('spawnCar', function(data, cb)
    garageOpen = false
    SetNuiFocus(false, false)
    TriggerServerEvent('sylver_garage:spawnCar', data.model, data.plate)
    cb({ ok = true })
end)

-- =====================
--  Fechar garagem
-- =====================
RegisterNUICallback('closeGarage', function(_, cb)
    garageOpen = false
    SetNuiFocus(false, false)
    cb({ ok = true })
end)
