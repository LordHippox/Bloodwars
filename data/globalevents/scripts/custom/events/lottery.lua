local rewards = {
    {5957, 1},
}

function onTime(interval)
    local players = Game.getPlayers()

    if #players > 0 and #rewards > 0 then
        local uid, n = math.random(1, #players), math.random(1, #rewards)
        local winner = players[uid]
        local reward, count = rewards[n][1], rewards[n][2]

        if winner and reward and count then
            winner:addItem(reward, count)
            Game.broadcastMessage('Player '.. winner:getName() ..' has won the lottery. Congratulations!', MESSAGE_STATUS_WARNING)
        end
    end

    return true
end
