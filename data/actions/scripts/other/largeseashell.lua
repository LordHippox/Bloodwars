function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getStorageValue(STORAGEVALUE_DELAY_LARGE_SEASHELL) <= os.time() then
        local chance = math.random(100)
        local msg = ""
        if chance <= 16 then
            player:addHealth(-200)
            msg = "Ouch! You pinched your fingers."
        elseif chance > 16 and chance <= 64 then
            Game.createItem(math.random(7632,7633), 1, player:getPosition())
            msg = "You found a beautiful pearl."
        else
            msg = "There's nothing inside."
        end
        player:say(msg, TALKTYPE_MONSTER_SAY, false, player, item:getPosition())
        item:transform(7553)
        item:decay()
        player:setStorageValue(STORAGEVALUE_DELAY_LARGE_SEASHELL, os.time() + 72000)
        item:getPosition():sendMagicEffect(CONST_ME_BUBBLES)
    else
        player:say("You've already opened a shell today.", TALKTYPE_MONSTER_SAY, false, player, item:getPosition())
    end
    return true
end
