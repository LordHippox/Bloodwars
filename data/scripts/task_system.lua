local taskSystemEvent = CreatureEvent("taskSystem")

function taskSystemEvent.onKill(creature, target)
    if creature:isPlayer() and target:isMonster() then
        local taskSystem = _G.taskSystem
        local dailyTasks = _G.dailyTasks

        local task = taskSystem[creature:getTaskMission()]
        local daily = dailyTasks[creature:getDailyTaskMission()]

        if task and creature:getStorageValue(taskSystem_storages[3]) < task.count then
            creature:setStorageValue(taskSystem_storages[3], creature:getStorageValue(taskSystem_storages[3]) + 1)
            if creature:getStorageValue(taskSystem_storages[8]) <= 0 and creature:getStorageValue(taskSystem_storages[3]) < task.count then
                creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "[Task System] Defeated: [" .. creature:getStorageValue(taskSystem_storages[3]) .. "/" .. task.count .. "] monsters for the task: " .. task.name .. ".")
            end
            if creature:getStorageValue(taskSystem_storages[3]) >= task.count then
                creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "[Task System] Congratulations! You completed the task: " .. task.name .. ", return to the NPC to claim your reward.")
            end
        end

        if daily and creature:getStorageValue(taskSystem_storages[5]) < daily.count then
            creature:setStorageValue(taskSystem_storages[5], creature:getStorageValue(taskSystem_storages[5]) + 1)
            if creature:getStorageValue(taskSystem_storages[8]) <= 0 and creature:getStorageValue(taskSystem_storages[5]) < daily.count then
                creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "[Daily Task System] Defeated: [" .. creature:getStorageValue(taskSystem_storages[5]) .. "/" .. daily.count .. "] monsters for the daily task: " .. daily.name .. ".")
            end
            if creature:getStorageValue(taskSystem_storages[5]) >= daily.count then
                creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "[Daily Task System] Congratulations! You completed the daily task: " .. daily.name .. ", return to the NPC to claim your reward.")
            end
        end
    end
    return true
end

taskSystemEvent:register()

local creatureEvent = CreatureEvent("taskLogin")

function creatureEvent.onLogin(player)
    player:registerEvent("taskSystem")
    return true
end

creatureEvent:register()

local talkAction = TalkAction("!task", "/task")

function talkAction.onSay(player, words, param)
    param = param:lower()
    local taskSystem = _G.taskSystem

    if isInArray({"counter", "contador"}, param) then
        player:setStorageValue(taskSystem_storages[8], player:getStorageValue(taskSystem_storages[8]) <= 0 and 1 or 0)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "[Task System] The counter has been " .. (player:getStorageValue(taskSystem_storages[8]) <= 0 and "activated" or "deactivated") .. ".")
        return true
    elseif isInArray({"daily", "diaria"}, param) then
        local dailyTasks = _G.dailyTasks
        local daily = player:getDailyTaskMission()
        if not dailyTasks[daily] or player:getStorageValue(taskSystem_storages[7]) <= 0 then
            player:sendCancelMessage("Sorry, you are not on any Daily Task.")
            return true
        elseif player:getStorageValue(taskSystem_storages[6]) - os.time() <= 0 and player:getStorageValue(taskSystem_storages[5]) < dailyTasks[daily].count then
            player:showTextDialog("Sorry, but you didn't finish the Daily Task in time! Please return to the NPC to start a new Daily Task.")
            return true
        end
        local taskInfo = "[->] CURRENT DAILY TASK INFO [<-]\n\nName: " .. dailyTasks[daily].name .. "\nProgress: [" .. (player:getStorageValue(taskSystem_storages[5]) < 0 and 0 or player:getStorageValue(taskSystem_storages[5])) .. "/" .. dailyTasks[daily].count .. "]\nDeadline: " .. os.date("%d %B %Y %X", player:getStorageValue(taskSystem_storages[6])) .. "\nMonsters to Hunt: " .. getMonsterFromList(dailyTasks[daily].monsters_list) .. "\n\n[->] CURRENT TASK REWARDS [<-]\n\nMoney: " .. (dailyTasks[daily].money > 0 and dailyTasks[daily].money or 0) .. "\nExperience: " .. (dailyTasks[daily].exp > 0 and dailyTasks[daily].exp or 0) .. "\nTask Points: " .. dailyTasks[daily].points .. "\nItems: " .. (#dailyTasks[daily].reward > 0 and getItemsFromList(dailyTasks[daily].reward) or "No reward items") .. "."
        return player:showTextDialog(1953, taskInfo)
    end

    local task = player:getTaskMission()
    if not taskSystem[task] or player:getStorageValue(taskSystem[task].start) <= 0 then
        player:sendCancelMessage("You are not on any task.")
        return true
    end

    local taskInfo = "-> CURRENT TASK [" .. task .. "/" .. #taskSystem .. "] <-\n\nTask Name: " .. taskSystem[task].name .. "\nTask Level: " .. taskSystem[task].level .. "\nTask Progress: [" .. (player:getStorageValue(taskSystem_storages[3]) < 0 and 0 or player:getStorageValue(taskSystem_storages[3])) .. "/" .. taskSystem[task].count .. "]\nMonster To Hunt: " .. getMonsterFromList(taskSystem[task].monsters_list) .. ".\nItems for Delivery: " .. (#taskSystem[task].items > 0 and getItemsFromList(taskSystem[task].items) or "None") .. ".\n\n[->] CURRENT TASK REWARDS [<-]\n\nReward Money: " .. (taskSystem[task].money > 0 and taskSystem[task].money or 0) .. "\nReward Experience: " .. (taskSystem[task].exp > 0 and taskSystem[task].exp or 0) .. "\nReward Points: " .. taskSystem[task].points .. "\nReward Items: " .. (#taskSystem[task].reward > 0 and getItemsFromList(taskSystem[task].reward) or "No reward items") .. "."
    return player:showTextDialog(1953, taskInfo)
end

talkAction:separator(" ")
talkAction:register()

local ec = EventCallback

ec.onLook = function(self, thing, position, distance, description)
    if thing:isPlayer() then
        local rank = { name = "Private", id = 0 }
        local playerRank = thing:getRankTask()
        if playerRank then
            rank.name = playerRank
        end

        return ("%s Rank task: [%s]"):format(description, rank.name)
    end

    return description
end

ec:register(66)


