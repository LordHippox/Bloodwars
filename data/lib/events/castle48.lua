--[[
CREATE TABLE `castle_48` (
  `guild_id` int(3) NOT NULL,
) ENGINE=MyISAM DEFAULT CHARSET=latin1
--]]

Castle48H = {
	players = {},
	guilds ={},
	msg = {
		prefix = "[Castle48H] ",
		start = "The event has started, good luck to all guilds!",
		endEvent = "The event has ended and everyone has been teleported to the temple.",
		guildWinner = "The winning guild was %s. All members of the guild gain %d%% more experience until 3 PM tomorrow.",
		openEvent = "The event will start in %d minute%s, get ready!",
		endingEvent = "The event will end in %d minute%s! Seize the throne!",
		notOpen = "The event has not been opened yet!",
		notGuild = "You do not belong to a guild to enter this event.",
		alreadyOwner = "The dominant guild is already yours.",
		nowOwner = "The guild %s has just dominated the event.",
		notWinner = "No guild has conquered the castle.",
		levelMin = "You need to be level %d or higher%s.",
		vote = "The voting has been opened. Use !castle48 1 for the last dominant to win or !castle48 2 for the guild dominant for the longest time to win.",
		chooseVote = "The voting has ended and it was determined that %s with %d votes.",
		tieVote = "The voting was tied! The last castle dominant will be the winner!",
	},
	days = {
		["Sunday"] = {"12:48"},
		["Tuesday"] = {"20:00"},
		["Thursday"] = {"20:00"},
		["Friday"] = {"20:00"},
		["Saturday"] = {"20:00"},
	},
	levelMin = 100,
	plusXP = 50,
	storageGlobal = 74641,
	storageLever = 74642,
	storageVoteOne = 74643,
	storageVoteTwo = 74644,
	playerStorageVote = 74645,
	storageVoteFinal = 74646,
	actionIDEnter = 7197,
	actionIDExit = 7198,
}

Castle48H.open = function()
	Game.setStorageValue(Castle48H.storageGlobal, 0)
	Game.setStorageValue(Castle48H.storageVoteOne, 0)
	Game.setStorageValue(Castle48H.storageVoteTwo, 0)
	Game.broadcastMessage(Castle48H.msg.prefix .. Castle48H.msg.vote)
	addEvent(Game.broadcastMessage, 5 * 60 * 1000, Castle48H.msg.prefix .. Castle48H.msg.openEvent:format(5, "s"))
	addEvent(Game.broadcastMessage, 7 * 60 * 1000, Castle48H.msg.prefix .. Castle48H.msg.openEvent:format(3, "s"))
	addEvent(function()
		Game.broadcastMessage(Castle48H.msg.prefix .. Castle48H.msg.openEvent:format(1, ""))
	end, 9 * 60 * 1000)
	addEvent(function()
		if Game.getStorageValue(Castle48H.storageVoteOne) > Game.getStorageValue(Castle48H.storageVoteTwo) then
			Game.broadcastMessage(Castle48H.msg.prefix .. Castle48H.msg.chooseVote:format("the last castle dominant will be the winner", Game.getStorageValue(Castle48H.storageVoteOne)))
			Game.setStorageValue(Castle48H.storageVoteFinal, 1)
		elseif Game.getStorageValue(Castle48H.storageVoteTwo) > Game.getStorageValue(Castle48H.storageVoteOne) then
			Game.broadcastMessage(Castle48H.msg.prefix .. Castle48H.msg.chooseVote:format("the guild dominant for the longest time will be the winner", Game.getStorageValue(Castle48H.storageVoteTwo)))
			Game.setStorageValue(Castle48H.storageVoteFinal, 2)
		else
			Game.broadcastMessage(Castle48H.msg.prefix .. Castle48H.msg.tieVote)
			Game.setStorageValue(Castle48H.storageVoteFinal, 1)
		end
		Game.setStorageValue(Castle48H.storageGlobal, 1)
		Game.broadcastMessage(Castle48H.msg.prefix .. Castle48H.msg.start)
	end, 10 * 60 * 1000)
end

Castle48H.close = function()
	Game.broadcastMessage(Castle48H.msg.prefix .. Castle48H.msg.endingEvent:format(5, "s"))
	addEvent(Game.broadcastMessage, 2 * 60 * 1000, Castle48H.msg.prefix .. Castle48H.msg.endingEvent:format(3, "s"))
	addEvent(Game.broadcastMessage, 4 * 60 * 1000, Castle48H.msg.prefix .. Castle48H.msg.endingEvent:format(1, ""))
	addEvent(function()
		if Game.getStorageValue(Castle48H.storageVoteFinal) == 1 then
			if Game.getStorageValue(Castle48H.storageLever) >= 0 then
				Game.broadcastMessage(Castle48H.msg.prefix .. Castle48H.msg.endEvent)
				local guild = Guild(Game.getStorageValue(Castle48H.storageLever))
				Game.broadcastMessage(Castle48H.msg.prefix .. Castle48H.msg.guildWinner:format(guild:getName(), Castle48H.plusXP))
				db.query(('UPDATE `castle_48` SET `guild_id` = "%d"'):format(guild:getId()))
			else
				Game.broadcastMessage(Castle48H.msg.prefix .. Castle48H.msg.endEvent)
				Game.broadcastMessage(Castle48H.msg.prefix .. Castle48H.msg.notWinner)
				db.query(('UPDATE `castle_48` SET `guild_id` = "%d"'):format(-1))
			end
		elseif Game.getStorageValue(Castle48H.storageVoteFinal) == 2 then
			if #Castle48H.guilds ~= nil then
				table.sort(Castle48H.guilds, function(a,b) return a[1] > b[1] end)
				Game.broadcastMessage(Castle48H.msg.prefix .. Castle48H.msg.endEvent)
				local guild = Guild(Castle48H.guilds[1])
				Game.broadcastMessage(Castle48H.msg.prefix .. Castle48H.msg.guildWinner:format(guild:getName(), Castle48H.plusXP))
				db.query(('UPDATE `castle_48` SET `guild_id` = "%d"'):format(guild:getId()))
			else
				Game.broadcastMessage(Castle48H.msg.prefix .. Castle48H.msg.notWinner)
				db.query(('UPDATE `castle_48` SET `guild_id` = "%d"'):format(-1))
			end
		else
			print("Error Castle48H - close function")
		end
		Game.setStorageValue(Castle48H.storageGlobal, -1)
		Game.setStorageValue(Castle48H.storageLever, -1)
		Game.setStorageValue(Castle48H.storageVoteFinal, -1)
		Castle48H.endEvent()
		db.query('UPDATE `player_storage SET `0` WHERE `key` = '.. Castle48H.playerStorageVote)
	end, 5 * 60 * 1000)
end

Castle48H.insertPlayer = function(playerId)
	if not Castle48H.players[playerId] then
		Castle48H.players[playerId] = {}
	end
end

Castle48H.deletePlayer = function(playerId)
	if Castle48H.players[playerId] then
		Castle48H.players[playerId] = nil
	end
end

Castle48H.useLever = function(guildId)
	if Game.getStorageValue(Castle48H.storageVoteFinal) == 1 then
		Game.setStorageValue(Castle48H.storageLever, guildId)
	elseif Game.getStorageValue(Castle48H.storageVoteFinal) == 2 then
		if not Castle48H.guilds[guildId] then
			Castle48H.guilds[guildId] = 0
		end
		Game.setStorageValue(Castle48H.storageLever, guildId)
		addEvent(function (guildId)
			Castle48H.guilds[guildId] = Castle48H.guilds[guildId] + 1
		end, 1000)
		Castle48H.useLever(guildId)
	else
		print(">> Error in Castle48H - useLever function")
	end
end

Castle48H.removePlayers = function()
	for a in pairs(Castle48H.players) do
		local player = Player(a)
		player:teleportTo(player:getTown():getTemplePosition())
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		Castle48H.deletePlayer(player:getId())
	end
end

Castle48H.removeGuilds = function()
	for b in pairs(Castle48H.guilds) do
		Castle48H.guilds[b] = nil
	end
end

Castle48H.endEvent = function()
	Castle48H.removePlayers()
	Castle48H.removeGuilds()
end

Castle48H.checkGuildWinner = function()
	local guildId  = -1
	local resultId = db.storeQuery("SELECT `guild_id` FROM `castle_48`;")
	if (resultId ~= false) then
	  guildId = result.getDataInt(resultId, "guild_id")
	  result.free(resultId)
	end
	return guildId
end
