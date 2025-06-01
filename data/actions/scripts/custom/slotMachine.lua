if not slotMachineData then
	slotMachineData = {
		needItem = {id = 9020, count = 5},
		items = vector(12328, 11144, 9693, 12544, 5957, 11421),

		positions = {
			Position(953, 1204, 7),
			Position(954, 1204, 7),
			Position(955, 1204, 7)
		},
		positionEffectDice = {
			Position(954, 1205, 7),
			Position(954, 1204, 7),
		},

		rolled = vector()
	}
end

local positions = slotMachineData.positions
local function drawEffects()
	local n = 0
	local function decrease()
		if slotMachineData.owner then
			return
		end
		local t = 20 - n
		if t > 0 then
			n = n + 1
			for _, position in ipairs(positions) do
				position:sendMagicEffect(math.random(CONST_ME_GIFT_WRAPS, CONST_ME_FIREWORK_BLUE))
			end
			addEvent(decrease, 850)
		end
	end
	decrease()
end

local function checkEquals(itemVec)
    local ret = true
    for i = 1, itemVec:size() do
        if itemVec:get(i) ~= itemVec:get(math.min(itemVec:size(), i + 1)) then
            ret = false
            break
        end
    end
	return ret, itemVec:front()
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local name = player:getName()

	if slotMachineData.owner then
		player:sendCancelMessage('Wait your turn.')
		return true
	else
		local item = slotMachineData.needItem
		if not player:removeItem(item.id, item.count) then
			player:sendCancelMessage(('You don/t have %dx %s.'):format(item.count, ItemType(item.id):getName()))
			return true
		end
		slotMachineData.owner = name
	end

	item:transform(item.itemid + 1)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	fromPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	slotMachineData.positionEffectDice[1]:sendMagicEffect(CONST_ME_CRAPS)
	slotMachineData.positionEffectDice[2]:sendMagicEffect(CONST_ME_CRAPS)


	-- clear items
	for index, position in ipairs(positions) do
		local tile = Tile(position)
		if tile then
			local item = tile:getTopDownItem()
			if item then
				item:remove()
			end
		end

		addEvent(function()
			position:sendMagicEffect(CONST_ME_MAGIC_GREEN)
		end, index * 100)
	end

	local rolledVec = slotMachineData.rolled
	rolledVec:reset()

	for index, position in ipairs(positions) do
		addEvent(function()
			local item = Game.createItem(slotMachineData.items:rand(), 1, position)
			rolledVec:emplace_back(item:getId())

			position:sendMagicEffect(CONST_ME_FIREATTACK)
		end, index * 1000)
	end

	-- check the result
	addEvent(function(name)
		local win, rewardId = checkEquals(rolledVec)
		local reward = Game.createItem(rewardId, 1)
		local player = Player(name)
		if not player then
            if win then
                local resultId = db.storeQuery("SELECT `id` FROM `players` WHERE `name` = '" .. name.. "'")
                if not resultId then
                    result.free(resultId)
                    return false
                end

                local targetPlayerGUID = result.getDataInt(resultId, "id")
                result.free(resultId)

                targetPlayer = Player(targetPlayerGUID, true)
                if not targetPlayer then
                    return false
                end
                local itemSend = Game.createItem(rewardId, 1)
                targetPlayer:getInbox():addItemEx(itemSend, INDEX_WHEREEVER, FLAG_NOLIMIT)
                targetPlayer:delete()
			end
		else
			if win then
					local itemMandar = Game.createItem(rewardId, 1)
                    player:getInbox():addItemEx(itemMandar, INDEX_WHEREEVER, FLAG_NOLIMIT)
					inbox = true
				local rewardName = reward:getName()
				player:sendTextMessage(MESSAGE_INFO_DESCR, ('Congratulations, you won 1x %s.%s'):format(rewardName, inbox and ' The item has been sent to your inbox.' or ''))
				Game.broadcastMessage(('[Slot Machine]: %s found 1x %s, how lucky.'):format(name, rewardName), MESSAGE_EVENT_ADVANCE)
			end
		end

		item:transform(item.itemid - 1)
		rolledVec:reset()
		slotMachineData.owner = nil

		local centerPosition = positions[math.ceil(#positions/2)]
		if win then
			Game.sendAnimatedText('WIN!', centerPosition, 30)
			for _, position in ipairs(positions) do
				position:sendMagicEffect(CONST_ME_ENERGYAREA)
			end
			drawEffects()
		else
			Game.sendAnimatedText('LOSE!', centerPosition, 180)
			for _, position in ipairs(positions) do
				position:sendMagicEffect(CONST_ME_POFF)
			end
		end
	end, (#positions + 1) * 1000, name)
	return true
end
