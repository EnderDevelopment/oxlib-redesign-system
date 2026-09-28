local ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback('oxlib_redesign:getRedesign', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = xPlayer.identifier

    MySQL.Async.fetchScalar('SELECT redesign_data FROM oxlib_redesign WHERE player_id = @player_id', {
        ['@player_id'] = playerId
    }, function(result)
        if result then
            cb(json.decode(result))
        else
            cb({design = 'default'})
        end
    end)
end)

RegisterNetEvent('oxlib_redesign:saveRedesign')
AddEventHandler('oxlib_redesign:saveRedesign', function(redesignOption)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = xPlayer.identifier
    local redesignData = json.encode({design = redesignOption})

    MySQL.Async.execute('INSERT INTO oxlib_redesign (player_id, redesign_data) VALUES (@player_id, @redesign_data) ON DUPLICATE KEY UPDATE redesign_data = @redesign_data', {
        ['@player_id'] = playerId,
        ['@redesign_data'] = redesignData
    }, function(rowsChanged)
        if rowsChanged > 0 then
            print('Redesign data saved for player ' .. playerId)
        else
            print('Failed to save redesign data for player ' .. playerId)
        end
    end)
end)