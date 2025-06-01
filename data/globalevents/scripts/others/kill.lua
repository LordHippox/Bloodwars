function onKill(player, target)
  if not (player:isPlayer() and target:isPlayer()) then return true end
  if player:getIp() ~= target:getIp() then
    player:addExperience(5000)      -- give 5k EXP per kill
    Game.createItem(2260, 1, target:getPosition())  -- soul orb
  end
  return true
end
