function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return false
    end
  
    if (Game.getStorageValue(SNAKE.freeglobalstorage)) ~= 1 then
        player:teleportTo(SNAKE.controlpos)
        SNAKE.timer(player.uid,1,nil,1000)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '[MiniGame] Use CTRL + arrows to control the snake.')
        SNAKE.generateFood()
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Please wait.')
        player:teleportTo(fromPosition, true)
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end
    return true
end
