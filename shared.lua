function GetPlayerIdentifier(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    return xPlayer.identifier
end

function GetPlayerRedesign(playerId, cb)
    ESX.TriggerServerCallback('oxlib_redesign:getRedesign', function(result)
        cb(result)
    end, playerId)
end