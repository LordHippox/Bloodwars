function onLogin(player)
    local loginStr = "Welcome to {" .. configManager.getString(configKeys.SERVER_NAME) .. "}!"
    if player:getLastLoginSaved() <= 0 then
        loginStr = loginStr .. " Please choose your outfit."
        player:sendOutfitWindow()
    else
        if loginStr ~= "" then
            player:sendTextMessage(MESSAGE_STATUS_BLUE_LIGHT, loginStr)
        end
        loginStr = string.format("Your last visit was on {%s}.", os.date("%a %b %d %X %Y", player:getLastLoginSaved()))
    end
    player:sendTextMessage(MESSAGE_STATUS_BLUE_LIGHT, loginStr)

    -- Guild Leaders Highlight
    if configManager.getBoolean(configKeys.GUILD_LEADER_SQUARE) and player:getAccountType() < ACCOUNT_TYPE_GAMEMASTER then
        Game.guildLeaderSquare(player:getId())
    end

    -- Events
    if player:getStorageValue(STORAGEVALUE_EVENTS) >= 1 then
        player:teleportTo(player:getTown():getTemplePosition())
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
        player:setStorageValue(STORAGEVALUE_EVENTS, 0)
    end

    -- Dodge/Critical System
    if player:getDodgeLevel() == -1 then
        player:setDodgeLevel(0)
    end
    if player:getCriticalLevel() == -1 then
        player:setCriticalLevel(0)
    end

    -- Monster Hunt
    if Game.getStorageValue(MONSTER_HUNT.storages.monster) == nil then
        player:setStorageValue(MONSTER_HUNT.storages.player, 0)
    end

    -- Mining
    if player:getStorageValue(configMining.level.storageTentativas) == -1 or player:getStorageValue(configMining.level.storageNivel) == -1 then
        player:setStorageValue(configMining.level.storageTentativas, 0) -- Attempts
        player:setStorageValue(configMining.level.storageNivel, 1) -- Level
    end

    -- PVP Balance
    if configManager.getBoolean(configKeys.PVP_BALANCE) then
        player:registerEvent("PvpBalance")
        player:registerEvent("PvpBalanceMA")
    end

    player:loadSpecialStorage()

    --[[ Promotion
    local vocation = player:getVocation()
    local promotion = vocation:getPromotion()
    if player:isPremium() then
        local value = player:getStorageValue(STORAGEVALUE_PROMOTION)
        if not promotion and value ~= 1 then
            player:setStorageValue(STORAGEVALUE_PROMOTION, 1)
        elseif value == 1 then
            player:setVocation(promotion)
        end
    elseif not promotion then
        player:setVocation(vocation:getDemotion())
    end
    --]]

    -- XP Potion
    if player:getStorageValue(STORAGEVALUE_POTIONXP_ID) ~= -1 and player:getStorageValue(STORAGEVALUE_POTIONXP_TEMPO) <= os.time() then
        player:setStorageValue(STORAGEVALUE_POTIONXP_ID, -1)
        player:setStorageValue(STORAGEVALUE_POTIONXP_TEMPO, -1)
        player:sendCancelMessage("Your bonus experience time from the experience potion has ended!")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    elseif player:getStorageValue(STORAGEVALUE_POTIONXP_ID) ~= -1 and player:getStorageValue(STORAGEVALUE_POTIONXP_TEMPO) > os.time() then
        local idPlayer = player:getId()
        addEvent(function()
            local player = Player(idPlayer)
            if player then
                player:setStorageValue(STORAGEVALUE_POTIONXP_ID, -1)
                player:setStorageValue(STORAGEVALUE_POTIONXP_TEMPO, -1)
                player:sendCancelMessage("Your bonus experience time from the experience potion has ended!")
                player:getPosition():sendMagicEffect(CONST_ME_POFF)
            end
        end, (player:getStorageValue(STORAGEVALUE_POTIONXP_TEMPO) - os.time()) * 1000)
    end

    -- Loot Potion
    if player:getStorageValue(STORAGEVALUE_LOOT_ID) ~= -1 and player:getStorageValue(STORAGEVALUE_LOOT_TEMPO) <= os.time() then
        player:setStorageValue(STORAGEVALUE_LOOT_ID, -1)
        player:setStorageValue(STORAGEVALUE_LOOT_TEMPO, -1)
        player:sendCancelMessage("Your bonus loot time from the potion has ended!")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    elseif player:getStorageValue(STORAGEVALUE_LOOT_ID) ~= -1 and player:getStorageValue(STORAGEVALUE_LOOT_TEMPO) > os.time() then
        local idPlayer = player:getId()
        addEvent(function()
            local player = Player(idPlayer)
            if player then
                player:setStorageValue(STORAGEVALUE_LOOT_ID, -1)
                player:setStorageValue(STORAGEVALUE_LOOT_TEMPO, -1)
                player:sendCancelMessage("Your bonus loot time from the potion has ended!")
                player:getPosition():sendMagicEffect(CONST_ME_POFF)
            end
        end, (player:getStorageValue(STORAGEVALUE_LOOT_TEMPO) - os.time()) * 1000)
    end

    -- Events
    player:registerEvent("PlayerDeath")
    player:registerEvent("AnimationUp")
    player:registerEvent("DropLoot")
    player:registerEvent("DodgeCriticalSystem")
    player:registerEvent("DodgeManaSystem")
    player:registerEvent("MonsterHunt")
    player:registerEvent("AutoLoot")
    player:registerEvent("Exiva")
    player:registerEvent("Events")
    player:registerEvent("Tasks")
    player:registerEvent("SuperUP")
    player:registerEvent("GuildLevel")
	 player:registerEvent("TaskSystemWindow")
	  player:registerEvent("TaskSystemKill")

    return true
end
