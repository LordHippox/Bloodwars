ANTIBOT = {
    prefix = "[AntiBot] ",
    questions = {
        {question = "What year did COVID-19 begin?", staticAnswer = true, answer = "2019"},
        {question = "What is your current Sword skill?", skill = true, answer = SKILL_SWORD},
        {question = "What is your current Club skill?", skill = true, answer = SKILL_CLUB},
        {question = "What is your current Distance skill?", skill = true, answer = SKILL_DISTANCE},
        {question = "What is your current level?", answer = "level"},
        {question = "What is today's date?", answer = "day"},
    },
    playerQuestion = {},
    messages = {
        time = "You have %s to answer the question.",
        chat = "This chat can only be used during verification.",
        howAnswer = "You should answer only the response, for example: What is today's date? Answer: %d",
        correctAnswer = "You have answered the question correctly. Thank you.",
        incorrectAnswer = "You have answered incorrectly. You still have %d attempts.",
        logout = "You cannot log out while you have an active verification.",
    },
    punishment = {
        try = {
            max = 3,
            reason = "Excessive attempts.",
            timePunishment = 1, -- In days
            players = {},
        },
        time = {
            maxTime = 180, -- In seconds
            reason = "Did not answer the question within the stipulated time.",
            timePunishment = 2, -- In days
            players = {},
        },
    },
    notUseOnTrainers = true, -- True = training players will not be checked
    notUseOnPz = true, -- True = players on pz will not be checked
    verification = {40, 60}, -- in minutes
}

function ANTIBOT:addTry(playerId)
    local player = Player(playerId)
    if not player then 
        return false
    end
    playerId = player:getId()
    if not ANTIBOT.punishment.try.players[playerId] then
        ANTIBOT.punishment.try.players[playerId] = 0
    end
    ANTIBOT.punishment.try.players[playerId] = ANTIBOT.punishment.try.players[playerId] + 1
    if ANTIBOT.punishment.try.players[playerId] and ANTIBOT.punishment.try.players[playerId] >= ANTIBOT.punishment.try.max then
        sendChannelMessage(13, TALKTYPE_CHANNEL_O, ANTIBOT.prefix .. ANTIBOT.punishment.try.reason)
        ANTIBOT:addPunishment(playerId)
    end
end

function ANTIBOT:time(playerId)
    local player = Player(playerId)
    if not player then
        ANTIBOT:reset(playerId)
        return false
    end
    playerId = player:getId()
    if (ANTIBOT.notUseOnPz) and (Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE)) then
        ANTIBOT:reset(playerId)
        return false
    end
    if ANTIBOT.notUseOnTrainers and staminaBonus.events[player:getName()] then
        ANTIBOT:reset(playerId)
        return false
    end
    if not ANTIBOT.punishment.time.players[playerId] then
        ANTIBOT.punishment.time.players[playerId] = 0
        ANTIBOT:sendQuestions(playerId)
    end
    addEvent(function()
        if ANTIBOT.punishment.time.players[playerId] and ANTIBOT.punishment.time.players[playerId] >= 0 and ANTIBOT.punishment.time.players[playerId] < ANTIBOT.punishment.time.maxTime then
            ANTIBOT.punishment.time.players[playerId] = ANTIBOT.punishment.time.players[playerId] + 1
            player:sendCancelMessage(ANTIBOT.prefix .. ANTIBOT.messages.time:format(string.diff(ANTIBOT.punishment.time.maxTime - ANTIBOT.punishment.time.players[playerId], true)))
            ANTIBOT:time(playerId)
        end
    end, 1000)
    if ANTIBOT.punishment.time.players[playerId] and ANTIBOT.punishment.time.players[playerId] >= ANTIBOT.punishment.time.maxTime then
        ANTIBOT:addPunishment(playerId)
    end
end

function ANTIBOT:sendQuestions(playerId)
    local player = Player(playerId)
    if not player then
        return false
    end
    playerId = player:getId()
    random = math.random(#ANTIBOT.questions)
    ANTIBOT.playerQuestion[playerId] = random
    player:say("ANTIBOT", TALKTYPE_MONSTER_SAY)
    player:openChannel(13)
    addEvent(sendChannelMessage, 500, 13, TALKTYPE_CHANNEL_O, ANTIBOT.prefix .. ANTIBOT.messages.howAnswer:format(os.date("%d")))
    addEvent(sendChannelMessage, 800, 13, TALKTYPE_CHANNEL_O, ANTIBOT.prefix .. ANTIBOT.questions[random].question)
end

function ANTIBOT:reset(playerId)
    ANTIBOT.punishment.try.players[playerId] = nil
    ANTIBOT.punishment.time.players[playerId] = nil
    ANTIBOT.playerQuestion[playerId] = nil
end

function ANTIBOT:addPunishment(playerId)
    local player = Player(playerId)
    if not player then 
        return false
    end
    playerId = player:getId()
    local accountId = getAccountNumberByPlayerName(player:getName())
    if accountId == 0 then
        return false
    end
    local resultId = db.storeQuery("SELECT 1 FROM `account_bans` WHERE `account_id` = " .. accountId)
    if resultId ~= false then
        result.free(resultId)
        return false
    end
    local timeNow = os.time()
    if ANTIBOT.punishment.try.players[playerId] and ANTIBOT.punishment.try.players[playerId] >= ANTIBOT.punishment.try.max then
        db.query("INSERT INTO `account_bans` (`account_id`, `reason`, `banned_at`, `expires_at`, `banned_by`) VALUES (" ..
            accountId .. ", " .. db.escapeString(ANTIBOT.prefix .. ANTIBOT.punishment.try.reason) .. ", " .. timeNow .. ", " .. timeNow + (ANTIBOT.punishment.try.timePunishment * 86400) .. ", " .. player:getGuid() .. ")")
    elseif ANTIBOT.punishment.time.players[playerId] and ANTIBOT.punishment.time.players[playerId] >= ANTIBOT.punishment.time.maxTime then
        db.query("INSERT INTO `account_bans` (`account_id`, `reason`, `banned_at`, `expires_at`, `banned_by`) VALUES (" ..
            accountId .. ", " .. db.escapeString(ANTIBOT.prefix .. ANTIBOT.punishment.time.reason) .. ", " .. timeNow .. ", " .. timeNow + (ANTIBOT.punishment.time.timePunishment * 86400) .. ", " .. player:getGuid() .. ")")
    end
    ANTIBOT:reset(playerId)
    player:save()
    player:getPosition():sendMagicEffect(CONST_ME_POFF)
    player:remove()
end
