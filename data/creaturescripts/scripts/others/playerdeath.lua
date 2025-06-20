function onDeath(player, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local playerId = player:getId()
	if nextUseStaminaTime[playerId] then
		nextUseStaminaTime[playerId] = nil
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You died.")
	player:say("I'M SCREWED", TALKTYPE_MONSTER_SAY)

	if not deathListEnabled then
		return
	end

	local playerBless = 0
	local aolLog = 0

	local amulet = player:getSlotItem(CONST_SLOT_NECKLACE)
    if amulet and amulet.itemid == ITEM_AMULETOFLOSS then
        aolLog = 1
	end

    for i = 1, maxBless do
        if player:hasBlessing(i) then
            local count = i * i
            playerBless = playerBless + count
        end
    end

	local byPlayer = 0
	local killerName = ""
	if killer then
		if killer:isPlayer() then
			byPlayer = 1
			killerName = killer:getName()
		else
			local master = killer:getMaster()
			if master and master ~= killer and master:isPlayer() then
				killer = master
				byPlayer = 1
				killerName = killer:getName()
			end
		end
	else
		killerName = "field item"
	end

	local byPlayerMostDamage = 0
	local mostDamageName = ""
	if mostDamageKiller then
		if mostDamageKiller:isPlayer() then
			byPlayerMostDamage = 1
			mostDamageName = mostDamageKiller:getName()
		else
			local master = mostDamageKiller:getMaster()
			if master and master ~= mostDamageKiller and master:isPlayer() then
				mostDamageKiller = master
				byPlayerMostDamage = 1
				mostDamageName = mostDamageKiller:getName()
			end
		end
	else
		mostDamageName = "field item"
	end

	local playerGuid = player:getGuid()
	db.query("INSERT INTO `player_deaths` (`player_id`, `time`, `level`, `killed_by`, `is_player`, `mostdamage_by`, `mostdamage_is_player`, `unjustified`, `mostdamage_unjustified`, `bless`, `aol`) VALUES (" .. playerGuid .. ", " .. os.time() .. ", " .. player:getLevel() .. ", " .. db.escapeString(killerName) .. ", " .. byPlayer .. ", " .. db.escapeString(mostDamageName) .. ", " .. byPlayerMostDamage .. ", " .. (unjustified and 1 or 0) .. ", " .. (mostDamageUnjustified and 1 or 0) .. ", ".. playerBless ..", ".. aolLog ..")")
	local resultId = db.storeQuery("SELECT `player_id` FROM `player_deaths` WHERE `player_id` = " .. playerGuid)

	local deathRecords = 0
	local tmpResultId = resultId
	while tmpResultId ~= false do
		tmpResultId = result.next(resultId)
		deathRecords = deathRecords + 1
	end

	if resultId ~= false then
		result.free(resultId)
	end

	local limit = deathRecords - maxDeathRecords
	if limit > 0 then
		db.asyncQuery("DELETE FROM `player_deaths` WHERE `player_id` = " .. playerGuid .. " ORDER BY `time` LIMIT " .. limit)
	end

	if byPlayer == 1 then
		local targetGuild = player:getGuild()
		targetGuild = targetGuild and targetGuild:getId() or 0
		if targetGuild ~= 0 then
			local killerGuild = killer:getGuild()
			killerGuild = killerGuild and killerGuild:getId() or 0
			if killerGuild ~= 0 and targetGuild ~= killerGuild and isInWar(playerId, killer:getId()) then
				local warId = false
				resultId = db.storeQuery("SELECT `id` FROM `guild_wars` WHERE `status` = 1 AND ((`guild1` = " .. killerGuild .. " AND `guild2` = " .. targetGuild .. ") OR (`guild1` = " .. targetGuild .. " AND `guild2` = " .. killerGuild .. "))")
				if resultId ~= false then
					warId = result.getNumber(resultId, "id")
					result.free(resultId)
				end

				if warId ~= false then
					db.asyncQuery("INSERT INTO `guildwar_kills` (`killer`, `target`, `killerguild`, `targetguild`, `time`, `warid`) VALUES (" .. db.escapeString(killerName) .. ", " .. db.escapeString(player:getName()) .. ", " .. killerGuild .. ", " .. targetGuild .. ", " .. os.time() .. ", " .. warId .. ")")
				end
			end
		end
	end

	if killer and killer:isPlayer() then
		player:sendTextMessage(TALKTYPE_CHANNEL_O, "Player ".. player:getName() .. " ["..player:getLevel().."] was killed by player ".. killer:getName() .." ["..killer:getLevel().."].", 12)
		Game.broadcastMessage(player:getName().." ["..player:getLevel().."] has just been killed by player "..killer:getName().." ["..killer:getLevel().."].", MESSAGE_STATUS_SMALL)
	end
end
