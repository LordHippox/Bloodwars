local event = {}

local function addOnlineToken(playerId)
    local player = Player(playerId)
    if not player then
        return false
    end
    if player:getIp() == 0 then
        event[player:getId()] = nil       
        return false
    end
    player:addOnlineTime(1)
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have earned 1 online token for staying online for 1 hour without logging out.")
    player:addItem(12543, 1)
    
    event[player:getId()] = addEvent(addOnlineToken, 60 * 60 * 1000, player:getId())
end

function onLogin(player)
    player:registerEvent("OnlineBonus")
    player:registerEvent("OnlineBonusLogout")
    if event[player:getId()] == nil then
        event[player:getId()] = addEvent(addOnlineToken, 60 * 60 * 1000, player:getId())    
    end
    return true
end

function onLogout(player)
    if event[player:getId()] then
        event[player:getId()] = nil
    end
    return true
end
