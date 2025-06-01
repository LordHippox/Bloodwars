BossRoom = {
    monstros = { -- Nome do boss, tempo em minutos para matar o boss, quantos items para entrar na sala
		[30000] = {bossName = "Laravel", bossId = 0, killTime = 15, countItem = 10, center = Position(187, 751, 7), x = 6, y = 6,},
		[30001] = {bossName = "Merlin", bossId = 0, killTime = 15, countItem = 10, center = Position(786, 934, 7), x = 5, y = 5,},
		[30002] = {bossName = "Merlin", bossId = 0, killTime = 15, countItem = 10, center = Position(786, 934, 7), x = 5, y = 5,},
		[30003] = {bossName = "Merlin", bossId = 0, killTime = 15, countItem = 10, center = Position(786, 934, 7), x = 5, y = 5,},
		[30004] = {bossName = "Merlin", bossId = 0, killTime = 15, countItem = 10, center = Position(786, 934, 7), x = 5, y = 5,},
		[30005] = {bossName = "Merlin", bossId = 0, killTime = 15, countItem = 10, center = Position(786, 934, 7), x = 5, y = 5,},
		[30006] = {bossName = "Merlin", bossId = 0, killTime = 15, countItem = 10, center = Position(786, 934, 7), x = 5, y = 5,},
		[30007] = {bossName = "Merlin", bossId = 0, killTime = 15, countItem = 10, center = Position(786, 934, 7), x = 5, y = 5,},
		[30008] = {bossName = "Merlin", bossId = 0, killTime = 15, countItem = 10, center = Position(786, 934, 7), x = 5, y = 5,},
		[30009] = {bossName = "Merlin", bossId = 0, killTime = 15, countItem = 10, center = Position(786, 934, 7), x = 5, y = 5,},
		[30010] = {bossName = "Merlin", bossId = 0, killTime = 15, countItem = 10, center = Position(786, 934, 7), x = 5, y = 5,},
		[30011] = {bossName = "Merlin", bossId = 0, killTime = 15, countItem = 10, center = Position(786, 934, 7), x = 5, y = 5,},
		[30012] = {bossName = "Merlin", bossId = 0, killTime = 15, countItem = 10, center = Position(786, 934, 7), x = 5, y = 5,},
		[30013] = {bossName = "Merlin", bossId = 0, killTime = 15, countItem = 10, center = Position(786, 934, 7), x = 5, y = 5,},
		[30014] = {bossName = "Merlin", bossId = 0, killTime = 15, countItem = 10, center = Position(786, 934, 7), x = 5, y = 5,},
		[30015] = {bossName = "Merlin", bossId = 0, killTime = 15, countItem = 10, center = Position(786, 934, 7), x = 5, y = 5,},
		[30016] = {bossName = "Merlin", bossId = 0, killTime = 15, countItem = 10, center = Position(786, 934, 7), x = 5, y = 5,},
		[30017] = {bossName = "Merlin", bossId = 0, killTime = 15, countItem = 10, center = Position(786, 934, 7), x = 5, y = 5,},
		[30018] = {bossName = "Merlin", bossId = 0, killTime = 15, countItem = 10, center = Position(786, 934, 7), x = 5, y = 5,},
		[30019] = {bossName = "Merlin", bossId = 0, killTime = 15, countItem = 10, center = Position(786, 934, 7), x = 5, y = 5,},
		[30020] = {bossName = "Merlin", bossId = 0, killTime = 15, countItem = 10, center = Position(786, 934, 7), x = 5, y = 5,}
      
    },
    msg = {
        notAvailable = "There is already a player inside this room. Please wait.",
        notItem = "You do not have %dx %s to enter this room.",
        timeOver = "Time's up and you didn't kill the boss.",
        enterRoom = "The boss will spawn in %d seconds, and you will have %d minutes to kill it! Good luck!",
    },
    itemID = 9020,
}

function BossRoom:setFreeRoom(id)
    local db = db.query("UPDATE `boss_room` SET `guid_player` = -1, `time` = 0, `to_time` = 0 WHERE room_id = ".. id)
    if not db then
        print("Error updating room ".. id .." of boss rooms.")
    end
end

function BossRoom:removeMonster(id)
    local monster = Monster(id)
    if monster then
        monster:getPosition():sendMagicEffect(CONST_ME_POFF)
        monster:remove()
    end
end
