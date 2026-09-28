local ESX = exports['es_extended']:getSharedObject()

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(10)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

function OpenRedesignMenu()
    local elements = {
        {label = 'Redesign Option 1', value = 'option1'},
        {label = 'Redesign Option 2', value = 'option2'},
        {label = 'Redesign Option 3', value = 'option3'}
    }

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'redesign_menu', {
        title = 'Redesign Menu',
        align = 'top-left',
        elements = elements
    }, function(data, menu)
        local redesignOption = data.current.value
        TriggerServerEvent('oxlib_redesign:saveRedesign', redesignOption)
        menu.close()
    end, function(data, menu)
        menu.close()
    end)
end

RegisterCommand('redesign', function()
    OpenRedesignMenu()
end, false)