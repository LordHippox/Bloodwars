function onLogout(player)
	local playerId = player:getId()
	if player:getStorageValue(STORAGEVALUE_EVENTS) >= 1 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You cannot log out while inside an event.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	if ANTIBOT.punishment.try.players[player:getId()] or ANTIBOT.punishment.time.players[player:getId()] then
		player:sendTextMessage(MESSAGE_INFO_DESCR, ANTIBOT.prefix .. ANTIBOT.messages.logout)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	player:say("We fly high, witches!", TALKTYPE_MONSTER_SAY)
	player:saveSpecialStorage()
	ANTIBOT:reset(playerId)
	if nextUseStaminaTime[playerId] then
		nextUseStaminaTime[playerId] = nil
	end
	return true
end
