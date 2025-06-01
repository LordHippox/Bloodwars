function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    local message = "---------[+]----------- [Boost Creature] -----------[+]---------\n\n   Every day, a monster is chosen to have additional experience and loot.\n\n---------[+]-----------------------------------[+]---------\n                                                  Chosen Creature: ".. firstToUpper(boostCreature[1].name) .."\n                                                        Experience: +".. boostCreature[1].exp .."%\n                                                              Loot: +".. boostCreature[1].loot .."%              "

    player:popupFYI(message)

    player:teleportTo(fromPosition, true)

    return true
end
