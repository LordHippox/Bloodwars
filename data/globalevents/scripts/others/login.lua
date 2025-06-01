local lobbyPos = Position(100,100,7)  -- adjust to your “lobby” tile

function onLogin(player)
  if player:getAccount():getId() ~= 1 then
    return true
  end

  player:teleportTo(lobbyPos)
  player:freeze(true)
  player:setStorageValue(2000, 0) -- 0 = vocation not chosen

  player:sendTextMessage(
    MESSAGE_STATUS_CONSOLE_BLUE,
    "Welcome!  To begin, type:  !vocation <sorcerer|druid|paladin|knight>"
  )
  return true
end
