local arenaSpawn = Position(105,100,7) -- adjust to your arena start
local vocations = {
  sorcerer = {
    id = VOCATION_SORCERER,
    skills = { fist=10, sword=10, club=10, axe=10, distance=80, shielding=20, fishing=10, magic=100 },
    items  = { {id=2160}, {id=2171}, {id=2396, count=50} }
  },
  druid = {
    id = VOCATION_DRUID,
    skills = { fist=10, sword=10, club=10, axe=10, distance=80, shielding=20, fishing=10, magic=100 },
    items  = { {id=2173}, {id=2170}, {id=7620, count=20} }
  },
  paladin = {
    id = VOCATION_PALADIN,
    skills = { fist=10, sword=80, club=10, axe=10, distance=100, shielding=20, fishing=10, magic=20 },
    items  = { {id=2456}, {id=2167}, {id=3538, count=200} }
  },
  knight = {
    id = VOCATION_KNIGHT,
    skills = { fist=10, sword=100, club=80, axe=80, distance=10, shielding=20, fishing=10, magic=10 },
    items  = { {id=2398}, {id=2395}, {id=2643} }
  }
}

-- helper to count how many of this vocation have been chosen today
local function nextVocationNumber(voc)
  local maxn = 0
  for _, pid in ipairs(Game.getPlayers()) do
    if pid:getVocation():getName():lower():find(voc) then
      local _, num = pid:getVocation():getName():lower():match(voc .. "%s*(%d+)")
      num = tonumber(num) or 0
      maxn = math.max(maxn, num)
    end
  end
  return maxn + 1
end

function onSay(player, words, param)
  if player:getAccount():getId() ~= 1 then return false end
  if player:getStorageValue(2000) ~= 0 then
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED,"You already picked a vocation.")
    return false
  end

  local choice = param:lower()
  local v = vocations[choice]
  if not v then
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED,"Invalid vocation.  Pick sorcerer, druid, paladin or knight.")
    return false
  end

  -- assign
  local n = nextVocationNumber(choice)
  player:setVocation(v.id)
  player:setName(string.ucfirst(choice) .. " " .. n)
  player:setLevel(100)
  player:setMaxHealth(1550)
  player:setHealth(1550)
  player:setMaxMana(8000)
  player:setMana(8000)

  -- skills
  for k, lv in pairs(v.skills) do
    player:setSkillLevel(k, lv)
    player:setSkillTries(k, player:getNeededSkillTries(lv))
  end

  -- equipment
  for _, it in ipairs(v.items) do
    player:addItem(it.id, it.count or 1)
  end

  -- finish
  player:teleportTo(arenaSpawn)
  player:freeze(false)
  player:setStorageValue(2000, 1)
  player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE,
    "You are now a " .. string.ucfirst(choice) .. " " .. n .. " — fight well!"
  )
  return false
end
