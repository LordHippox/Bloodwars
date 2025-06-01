function onThink(interval)
    local effects = {
     {position = Position(998, 1213, 7), effect = 29},
        {position = Position(998, 1215, 7), effect = 29},
        {position = Position(998, 1213, 7), text = "[PREMIUM]", effect = 40, say = true, color = math.random(1,255)},
        {position = Position(1000, 1202, 7), text = "MinGames", effect = 18, say = true, color = math.random(1,255)},
        {position = Position(988, 1207, 7), text = "SuperUP", effect = 18, say = true, color = math.random(1,255)},
        {position = Position(991, 1210, 7), text = "Welcome", effect = 18, say = true, color = math.random(1,255)},
   {position = Position(988, 1209, 7), text = "Trainers", effect = 18, say = true, color = math.random(1,255)},
{position = Position(988, 1210, 7), text = "Hunts", effect = 18, say = true, color = math.random(1,255)},
{position = Position(988, 1208, 7), text = "Quests", effect = 18, say = true, color = math.random(1,255)},
{position = Position(994, 1208, 7), text = "NPCs", effect = 18, say = true, color = math.random(1,255)},
{position = Position(996, 1208, 7), text = "Cities", effect = 18, say = true, color = math.random(1,255)},
{position = Position(995, 1208, 7), text = "Boss", effect = 18, say = true, color = math.random(1,255)},
{position = Position(985, 1202, 7), text = "Mining", effect = 45, color = math.random(1,255)},
{position = Position(1002, 1203, 7), text = "Castle 24H", effect = 7, say = true, color = math.random(1,255)},
{position = Position(817, 1408, 7), text = "Wintermere", effect = 40, say = true, color = math.random(1,255)},
{position = Position(819, 1408, 7), text = "Shadow Wood", effect = 40, say = true, color = math.random(1,255)},
{position = Position(821, 1408, 7), text = "Akravi", effect = 40, say = true, color = math.random(1,255)},
{position = Position(825, 1408, 7), text = "Al Arar", effect = 40, say = true, color = math.random(1,255)},
{position = Position(827, 1408, 7), text = "Bhark", effect = 40, say = true, color = math.random(1,255)},
{position = Position(829, 1408, 7), text = "Jamila Island", effect = 40, say = true, color = math.random(1,255)},
{position = Position(823, 1415, 7), text = "Temple", effect = 40, say = true, color = math.random(1,255)},
{position = Position(1653, 1108, 8), text = "Back", effect = 45, say = true, color = math.random(1,255)},
{position = Position(1545, 1067, 4), text = "Exit", effect = 1, say = true, color = math.random(1,255)},
{position = Position(991, 1200, 7), text = "Free\nAddon", effect = 37, say = true, color = math.random(1,255)},
{position = Position(401, 1248, 7), text = "Temple", effect = 40, say = true, color = math.random(1,255)},
{position = Position(1418, 1309, 8), text = "Temple", effect = 40, say = true, color = math.random(1,255)},
{position = Position(1426, 1309, 8), text = "Quests", effect = 40, say = true, color = math.random(1,255)},
{position = Position(1422, 1281, 7), text = "Temple", effect = 40, say = true, color = math.random(1,255)},
{position = Position(469, 1219, 6), text = "Temple", effect = 40, say = true, color = math.random(1,255)},
{position = Position(471, 1379, 6), text = "Hunts", effect = 49, say = true, color = math.random(1,255)},
{position = Position(472, 1379, 6), text = "Trainers", effect = 49, say = true, color = math.random(1,255)},
{position = Position(473, 1379, 6), text = "NPCs", effect = 49, say = true, color = math.random(1,255)},
{position = Position(980, 1204, 7), text = "Castle 48H", effect = 40, say = true, color = math.random(1,255)},
{position = Position(546, 1240, 7), text = "Temple", effect = 40, say = true, color = math.random(1,255)},
{position = Position(583, 1240, 7), text = "Temple", effect = 40, say = true, color = math.random(1,255)},
{position = Position(477, 1379, 6), text = "Cities", effect = 49, say = true, color = math.random(1,255)},
{position = Position(633, 1231, 5), text = "Temple", effect = 40, say = true, color = math.random(1,255)},
{position = Position(478, 1379, 6), text = "Bosses", effect = 49, say = true, color = math.random(1,255)},
{position = Position(1721, 946, 7), text = "Exit", effect = 49, say = true, color = math.random(1,255)},
{position = Position(1655, 982, 7), text = "Exit", effect = 49, say = true, color = math.random(1,255)},
{position = Position(1655, 985, 7), text = "Join to\nPlay!", effect = 49, say = true, color = math.random(1,255)},
{position = Position(984, 1210, 7), text = "Rotworms", effect = 57, say = false, color = math.random(1,255)},
{position = Position(997, 1208, 7), text = "Reward Chest", effect = 40, say = true, color = math.random(1,255)},
{position = Position(978, 1208, 7), text = "Boosted Creature\n ", effect = 30, say = true, color = math.random(1,255)},
{position = Position(978, 1207, 7), text = "+" .. boostCreature[1].exp .."% EXP", say = true, color = math.random(1,255)},
{position = Position(978, 1209, 7), text = "+" .. boostCreature[1].loot .."% Loot", say = true, color = math.random(1,255)},
{position = Position(817, 1424, 7), text = "Snake", effect = 40, say = true, color = math.random(1,255)},
{position = Position(819, 1424, 7), text = "Bomberman", effect = 40, say = true, color = math.random(1,255)},
{position = Position(821, 1433, 7), text = "Temple", effect = 40, say = true, color = math.random(1,255)}, 
{position = Position(997, 1200, 7), text = "Crafting System", effect = 40, say = true, color = math.random(1,255)} 

    -- Alavancas

}

    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    if settings.say then
                        spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                    else
                        Game.sendAnimatedText(settings.text, settings.position, settings.color)
                    end
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end
