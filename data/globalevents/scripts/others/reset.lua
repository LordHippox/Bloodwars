function resetPlayer(player)
  -- force-reset back to lobby & clear inventory, then re-prompt
  local lobbyPos = Position(100,100,7)
  player:teleportTo(lobbyPos)
  player:freeze(true)
  player:removeAllEquipment()
  player:removeAllItems()
  player:setStorageValue(2000, 0)
  player:sendTextMessage(
    MESSAGE_STATUS_CONSOLE_BLUE,
    "Your session has been reset.  Type !vocation <sorcerer|druid|paladin|knight> to start again."
  )
end

function onDeath(player, killer)
  if player:getAccount():getId() == 1 then
    -- delay slightly so corpse spawns first
    addEvent(resetPlayer, 2000, player)
  end
  return true
end

function onLogout(player)
  if player:getAccount():getId() == 1 then
    resetPlayer(player)
  end
  return true
end
