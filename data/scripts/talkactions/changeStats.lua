local change = TalkAction("!changestats")

function change.onSay(player, words, param)
    local switch = player:getStorageValue(92131) == -1 and 1 or -1

    player:sendTextMessage(MESSAGE_INFO_DESCR, 'Life and Mana (' .. (switch == 1 and 'percentage' or 'absolute') .. ')')

    player:setStorageValue(92131, switch)

    return false
end

change:register()
