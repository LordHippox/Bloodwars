local stamina_full = 42

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getStamina() >= (stamina_full * 60) then
        player:sendCancelMessage("Your stamina is already full.")
    else
        player:setStamina(stamina_full * 60)
        player:sendCancelMessage("Your stamina has been replenished.")
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
        item:remove(1)
    end

    return true
end
