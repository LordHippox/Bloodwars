local exp = Action()

function exp.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local xpPot = expPotion[item:getId()]
    if not xpPot then
        return false
    end

    if player:getStorageValue(STORAGEVALUE_POTIONXP_ID) >= 1 or player:getStorageValue(STORAGEVALUE_POTIONXP_TEMPO) > os.time() then
        player:sendCancelMessage("You already have an experience bonus active.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    if not item:remove() then
        player:sendCancelMessage("You do not have any experience potion.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    player:sendCancelMessage("You activated an experience bonus of +".. xpPot.exp .."% for ".. xpPot.tempo .." hour".. (xpPot.tempo > 1 and "s" or "") ..".")
    player:getPosition():sendMagicEffect(31)
    player:setStorageValue(STORAGEVALUE_POTIONXP_ID, item:getId())
    player:setStorageValue(STORAGEVALUE_POTIONXP_TEMPO, os.time() + xpPot.tempo * 60 * 60)

    local idPlayer = player:getId()
    addEvent(function()
        local player = Player(idPlayer)
        if player then
            player:setStorageValue(STORAGEVALUE_POTIONXP_ID, -1)
            player:setStorageValue(STORAGEVALUE_POTIONXP_TEMPO, -1)
            player:sendCancelMessage("Your experience bonus time for the experience potion has ended!")
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
        end
    end, xpPot.tempo * 60 * 60 * 1000)

    return true
end

exp:id(7477, 7253, 8205, 9734)
exp:register()
