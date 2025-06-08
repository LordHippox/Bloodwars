-- data/creaturescripts/scripts/others/reset_defaults.lua
-- Resets every player to level 100 (15,694,800 XP) + fixed skills/magic/items + teleports to temple,
-- and drops a Soul Orb on PvP kills.
-- Compatible with TFS 1.5 (protocol 8.60).

-- Hard‐coded XP for level 100 in Tibia 8.6
local EXP_FOR_LVL_100 = 15694800
local privilegedAccounts = { [2]=true, [3]=true, [4]=true, [10]=true }

----------------------------------------
-- Fully reset a player’s stats, skills, inventory, and location.
----------------------------------------
local function resetPlayerToDefaults(player)
	----------------------------------------
    -- [1] ENSURE PROMOTED VOCATION
    ----------------------------------------
    local currentVoc = player:getVocation():getId()
    -- If vocation is base (1–4), promote to (5–8)
    if currentVoc >= 1 and currentVoc <= 4 then
        player:setVocation(currentVoc + 4)
        currentVoc = currentVoc + 4
    end
    -- Now currentVoc is in [5..8], but we still want to treat ML/skills
    -- based on the “base” part (1–4) so for logic below we do:
    local baseVoc = currentVoc
    if baseVoc > 4 then
        baseVoc = baseVoc - 4
    end
    ----------------------------------------
    -- [A] TELEPORT to Player’s Temple (default spawn)
    ----------------------------------------
    local templePos = player:getTown():getTemplePosition()
    player:teleportTo(templePos)
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

    ----------------------------------------
    -- [B] FORCE LEVEL to 100 by setting exact XP
    ----------------------------------------
    local targetExp  = EXP_FOR_LVL_100
    local currentExp = player:getExperience()

    if currentExp < targetExp then
        player:addExperience(targetExp - currentExp, false)
    elseif currentExp > targetExp then
        player:removeExperience(currentExp - targetExp, false)
    end

    -- Because we used the exact XP, getLevel() should now be exactly 100.
    -- As a safety check, if it is not, we fine‐tune with 1 XP increments/decrements.
    local lvl = player:getLevel()
    if lvl > 100 then
        repeat
            player:removeExperience(1, false)
            lvl = player:getLevel()
        until lvl == 100
    elseif lvl < 100 then
        repeat
            player:addExperience(1, false)
            lvl = player:getLevel()
        until lvl == 100
    end

    ----------------------------------------
    -- [C] FORCE MAGIC LEVEL (ML) by Vocation
    ----------------------------------------
    local vocId = player:getVocation():getId()
    if vocId > 4 then
        vocId = vocId - 4
    end

    if vocId == 1 or vocId == 2 then
        -- Sorcerer / Druid → ML 65
        local defaultML = 65
        local currentML = player:getMagicLevel()
        if currentML ~= defaultML then
            player:addSkill(SKILL_MAGLEVEL, defaultML - currentML)
            player:removeManaSpent(player:getManaSpent())
        end
    elseif vocId == 3 then
        -- Paladin → ML 20
        local defaultML = 20
        local currentML = player:getMagicLevel()
        if currentML ~= defaultML then
            player:addSkill(SKILL_MAGLEVEL, defaultML - currentML)
            player:removeManaSpent(player:getManaSpent())
        end
    elseif vocId == 4 then
        -- Knight → ML 9
        local defaultML = 9
        local currentML = player:getMagicLevel()
        if currentML ~= defaultML then
            player:addSkill(SKILL_MAGLEVEL, defaultML - currentML)
            player:removeManaSpent(player:getManaSpent())
        end
    end

    ----------------------------------------
    -- [D] FORCE COMBAT SKILLS by Vocation
    ----------------------------------------
    if vocId == 4 then
        -- Knight: Sword, Axe, Club, Shielding = 100
        local meleeSkills = { SKILL_SWORD, SKILL_AXE, SKILL_CLUB, SKILL_SHIELD }
        for _, skillId in ipairs(meleeSkills) do
            local defaultLvl   = 100
            local currentLevel = player:getSkillLevel(skillId)
            if currentLevel ~= defaultLvl then
                player:addSkill(skillId, defaultLvl - currentLevel)
                player:removeSkillTries(skillId, player:getSkillTries(skillId))
            end
        end
    elseif vocId == 3 then
        -- Paladin: Distance = 100, Shielding = 80
        local distSkill   = SKILL_DISTANCE
        local shieldSkill = SKILL_SHIELD
        if player:getSkillLevel(distSkill) ~= 100 then
            player:addSkill(distSkill, 100 - player:getSkillLevel(distSkill))
            player:removeSkillTries(distSkill, player:getSkillTries(distSkill))
        end
        if player:getSkillLevel(shieldSkill) ~= 80 then
            player:addSkill(shieldSkill, 80 - player:getSkillLevel(shieldSkill))
            player:removeSkillTries(shieldSkill, player:getSkillTries(shieldSkill))
        end
    elseif vocId == 1 or vocId == 2 then
        -- Sorcerer / Druid: ensure shielding ≤ 10 (default low)
        local shieldSkill = SKILL_SHIELD
        if player:getSkillLevel(shieldSkill) > 10 then
            player:addSkill(shieldSkill, 10 - player:getSkillLevel(shieldSkill))
            player:removeSkillTries(shieldSkill, player:getSkillTries(shieldSkill))
        end
    end

    ----------------------------------------
    -- [E] RESET INVENTORY & GIVE STARTER KIT
    ----------------------------------------
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = player:getSlotItem(slot)
        if item then
            item:remove()
        end
    end

    -- Vocation‐specific gear (IDs are examples; adjust as desired):
    if vocId == 4 then
        -- ******** Knight Kit ********
		player:addItem(1988, 1)    -- 1 Backpack
		player:addItem(2171, 1)    -- Platinum Amulet
        player:addItem(2498, 1)    -- Royal Helmet
        player:addItem(2492, 1)    -- Dragon scale Mail
        player:addItem(2470, 1)    -- Golden Legs
        player:addItem(2195, 1)    -- Boots of Haste
        player:addItem(2514, 1)    -- MMS Shield
        player:addItem(7390, 1)    -- Justice Seeker (one‐handed)
        player:addItem(7434, 1)    -- Royal Axe (one‐handed)
        player:addItem(7429, 1)    -- Blessed Sceptre (one‐handed club)
		player:addItem(2123, 1)    -- Ring of the Sky
        player:addItem(7591, 1)    -- 1× Great Health Potion
		player:addItem(7589, 1)    -- 1× Strong Mana Potion
		player:addItem(2273, 1)    -- 1× Ultimate Healing Rune
		player:addItem(2293, 1)    -- 1× Magic Wall Rune
		player:addItem(2305, 1)    -- 1× Fire Bomb Rune
		player:addItem(2313, 1)    -- 1× Explosion Rune
		
    elseif vocId == 3 then
        -- ******** Paladin Kit ********
		player:addItem(1988, 1)    -- 1 Backpack
		player:addItem(2171, 1)    -- Platinum Amulet
        player:addItem(2498, 1)    -- Royal Helmet
        player:addItem(2466, 1)    -- Golden Armor
        player:addItem(2488, 1)    -- Crown Legs
        player:addItem(2195, 1)    -- Boots of Haste
        player:addItem(2520, 1)    -- Demon Shield
		player:addItem(2123, 1)    -- Ring of the Sky
        player:addItem(7367, 1)    -- Enchanted Spear (melee backup)
        player:addItem(2455, 1)    -- Crossbow
		player:addItem(2456, 1)    -- Bow
        player:addItem(2543, 100)  -- 100× Bolt
		player:addItem(7364, 100)  -- 100× Sniper Arrows
        player:addItem(7591, 1)    -- 1× Great Health Potion
        player:addItem(7590, 1)    -- 1× Mana Potion
		player:addItem(8472, 1)    -- 1× Great Spirit Potion
		player:addItem(2273, 1)    -- 1× Ultimate Healing Rune
		player:addItem(2293, 1)    -- 1× Magic Wall Rune
		player:addItem(2305, 1)    -- 1× Fire Bomb Rune

    elseif vocId == 1 then
        -- ******** Sorcerer Kit ********
		player:addItem(1988, 1)    -- 1 Backpack
		player:addItem(2171, 1)    -- Platinum Amulet
        player:addItem(2498, 1)    -- Royal Helmet
        player:addItem(2656, 1)    -- Blue Robe
		player:addItem(7730, 1)    -- Blue Legs
		player:addItem(2195, 1)    -- Boots of Haste
        player:addItem(2187, 1)    -- Wand of Inferno
		player:addItem(2520, 1)    -- Demon Shield
		player:addItem(2123, 1)    -- Ring of the Sky
        player:addItem(7590, 1)    -- 1× Great Mana Potion
        player:addItem(2268, 1)    -- 1× Sudden Death Rune
		player:addItem(2304, 1)    -- 1× Great Fireball Rune
		player:addItem(2273, 1)    -- 1× Ultimate Healing Rune
		player:addItem(2293, 1)    -- 1× Magic Wall Rune
		player:addItem(2305, 1)    -- 1× Fire Bomb Rune

    elseif vocId == 2 then
        -- ******** Druid Kit ********
		player:addItem(1988, 1)    -- 1 Backpack
		player:addItem(2171, 1)    -- Platinum Amulet
        player:addItem(2498, 1)    -- Royal Helmet
        player:addItem(2656, 1)    -- Blue Robe
		player:addItem(7730, 1)    -- Blue Legs
		player:addItem(2195, 1)    -- Boots of Haste
        player:addItem(2183, 1)    -- Hailstorm Rod
		player:addItem(2520, 1)    -- Demon Shield
		player:addItem(2123, 1)    -- Ring of the Sky
        player:addItem(7590, 1)    -- 1× Great Mana Potion
		player:addItem(2274, 1)    -- 1× Avalanche Rune
		player:addItem(2304, 1)    -- 1× Great Fireball Rune
        player:addItem(2273, 1)    -- 1× Ultimate Healing Rune
		player:addItem(2293, 1)    -- 1× Magic Wall Rune
		player:addItem(2269, 1)    -- 1× Wild Growth Rune
		player:addItem(2305, 1)    -- 1× Fire Bomb Rune
    end
	
	----------------------------------------
    -- [G] RESET OUTFIT TO DEFAULT TIBIA 8.6 LOOK
    ----------------------------------------
    -- Define a small table and fill it with lookType + no addons/colors:
    local outfit = {
        lookType   = 0,
        lookAddons = 0,
		lookMount   = 0,     -- ensure the mount slot is cleared
        lookHead   = 78,
        lookBody   = 106,
        lookLegs   = 58,
        lookFeet   = 76
    }
    local sexId = player:getSex()  -- PLAYERSEX_MALE (1) or PLAYERSEX_FEMALE (0)

    if baseVoc == 1 or baseVoc == 5 then
        -- Sorcerer / Master Sorcerer
        if sexId == PLAYERSEX_FEMALE then
            outfit.lookType = 138  -- female Sorcerer
        else
            outfit.lookType = 130  -- male Sorcerer
        end

    elseif baseVoc == 2 or baseVoc == 6 then
        -- Druid / Elder Druid
        if sexId == PLAYERSEX_FEMALE then
            outfit.lookType = 136  -- female Druid
        else
            outfit.lookType = 128  -- male Druid
        end

    elseif baseVoc == 3 or baseVoc == 7 then
        -- Paladin / Royal Paladin
        if sexId == PLAYERSEX_FEMALE then
            outfit.lookType = 140  -- female Paladin
        else
            outfit.lookType = 132  -- male Paladin
        end

    elseif baseVoc == 4 or baseVoc == 8 then
        -- Knight / Elite Knight
        if sexId == PLAYERSEX_FEMALE then
            outfit.lookType = 139  -- female Knight
        else
            outfit.lookType = 131  -- male Knight
        end
    end

  -- Reset soul correctly
	local currentSoul = player:getSoul()                  -- read soul points :contentReference[oaicite:5]{index=5}
	if currentSoul and currentSoul > 0 then
		player:addSoul(-currentSoul)                        -- reset to zero :contentReference[oaicite:6]{index=6}
	end

	
    -- Apply the outfit
    player:setOutfit(outfit)
	player:removeCondition(CONDITION_OUTFIT)

    -- Restore full health (setMana omitted, engine auto‐fills on login/respawn)
    player:setHealth(player:getMaxHealth())
	
	----------------------------------------------------------------
    -- [H] FOR PRIVILEGED ACCOUNTS: WIPE ALL STORAGE & STRIP ADDONS/MOUNTS
    ----------------------------------------------------------------
    local accId = player:getAccountId()
    if privilegedAccounts[accId] then
        local pid = player:getId()

        -- 1) Clear in-memory storage for every key this player has
        local res = db.storeQuery("SELECT `key` FROM `player_storage` WHERE `player_id`=" .. pid)  -- use storeQuery for sync queries :contentReference[oaicite:0]{index=0}
        if res then
            repeat
                local k = result.getDataInt(res, "key")                                          -- get each storage key :contentReference[oaicite:1]{index=1}
                player:setStorageValue(k, -1)                                                    -- reset to “unset” (-1) :contentReference[oaicite:2]{index=2}
            until not result.next(res)                                                         -- iterate rows :contentReference[oaicite:3]{index=3}
            result.free(res)                                                                    -- free the result :contentReference[oaicite:4]{index=4}
        end

        -- 2) Delete all those rows from the database
        db.query("DELETE FROM `player_storage` WHERE `player_id`=" .. pid)                     -- purge DB entries :contentReference[oaicite:5]{index=5}
	end
	
end

----------------------------------------
-- onLogin: Reset everything & register for death
----------------------------------------
function onLogin(player)
    resetPlayerToDefaults(player)
    player:registerEvent("ResetDefaultsDeath")
    return true
end

----------------------------------------
-- onLogout: Reset everything before saving to DB
----------------------------------------
function onLogout(player)
    resetPlayerToDefaults(player)
    return true
end

----------------------------------------
-- onDeath: Drop Soul Orb if PvP kill, then reset after respawn
----------------------------------------
function onDeath(player, corpse, killer, mostDamageKiller)
    -- 1) Determine killer‐player (last hit or most damage)
    local killerPlayer = nil
    if killer and killer:isPlayer() then
        killerPlayer = killer
    elseif mostDamageKiller and mostDamageKiller:isPlayer() then
        killerPlayer = mostDamageKiller
    end

    if killerPlayer then
        local corpsePos = player:getPosition()
        addEvent(function(pos)
            local tile = Tile(pos)
            if tile then
                local topItem = tile:getTopDownItem()
                if topItem and topItem:isContainer() then
                    topItem:addItem(2260, 1)  -- Soul Orb (ID 2260)
                end
            end
        end, 100, corpsePos)
    end

    -- 2) After death/respawn, reset everything (delay 500 ms)
    addEvent(function(pid)
        local p = Player(pid)
        if p then
            resetPlayerToDefaults(p)
        end
    end, 500, player:getId())

    return true
end
