if not boostCreature then boostCreature = {} end

BoostedCreature = {
    monsters = {"Demon", "Frost Dragon", "Grim Reaper"},
    db = true,
    exp = {20, 45},
    loot = {20, 45},
    position = Position(977, 1208, 7),
    messages = {
        prefix = "[Boosted Creature] ",
        chosen = "The chosen creature is %s. When killed, you receive +%d experience and +%d loot.",
    },
}

function BoostedCreature:start()
    local rand = math.random
    local monsterRand = BoostedCreature.monsters[rand(#BoostedCreature.monsters)]
    local expRand = rand(BoostedCreature.exp[1], BoostedCreature.exp[2])
    local lootRand = rand(BoostedCreature.loot[1], BoostedCreature.loot[2])
    table.insert(boostCreature, {name = monsterRand:lower(), exp = expRand, loot = lootRand})
    local monster = Game.createMonster(boostCreature[1].name, BoostedCreature.position, false, true)
    monster:setDirection(SOUTH)
end
