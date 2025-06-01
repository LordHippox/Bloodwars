taskSystem = {
    [1] = {name = "Rat", start = 176201, monsters_list = {"Rat"}, level = 1, count = 10, points = 2, items = {}, reward = {{2674, 5}}, exp = 100, money = 10},
    [2] = {name = "Cave Rats Spotted!", start = 176201, monsters_list = {"Cave Rat"}, level = 3, count = 5, points = 0, items = {}, reward = {{2580, 1}}, exp = 150, money = 15},
    [3] = {name = "Trouble in the Old Forest", start = 176201, monsters_list = {"Rat"}, level = 8, count = 10, points = 5, items = {}, reward = {{2160, 30}}, exp = 250, money = 50},

}

dailyTasks = {
    [1] = {name = "Daily Rat" ,monsters_list = {"Rat"}, count = 10, points = 3, reward = {{2674, 5}}, exp = 100, money = 10},
    [2] = {name = "Daily Cave Rat" ,monsters_list = {"Cave Rat"}, count = 50, points = 3, reward = {{2173, 1}}, exp = 130, money = 20},
}
                   -- task, points, count, daily task, daily count, daily time , daily start, contador
taskSystem_storages = {176601, 176602, 176603, 176604, 176605, 176606, 176607, 176608}

function Player:getTaskMission()
    return self:getStorageValue(taskSystem_storages[1]) < 0 and 1 or self:getStorageValue(taskSystem_storages[1])
end

function Player:getDailyTaskMission()
    return self:getStorageValue(taskSystem_storages[4]) < 0 and 1 or self:getStorageValue(taskSystem_storages[4])
end

function Player:getTaskPoints()
    return self:getStorageValue(taskSystem_storages[2]) < 0 and 0 or self:getStorageValue(taskSystem_storages[2])
end

function Player:randomDailyTask()
    local t = {
        [{6, 49}] = {1, 3},
        [{50, 79}] = {1, 3},
        [{80, 129}] = {1, 3},
        [{130, math.huge}] = {1, 3}
    }
    for a, b in pairs(t) do
        if self:getLevel() >= a[1] and self:getLevel() <= a[2] then
            return math.random(b[1], b[2])
        end
    end
    return 0
end

function Player:getRankTask()
    local ranks = {
        [{1, 20}] = "Huntsman",
        [{21, 50}] = "Ranger",
        [{51, 100}] = "Big Game Hunter",
        [{101, 200}] = "Trophy Hunter",
        [{201, math.huge}] = "Elite Hunter"
    }

    local defaultRank = "Private"

    for v, r in pairs(ranks) do
        if self:getTaskPoints() >= v[1] and self:getTaskPoints() <= v[2] then
            return r
        end
    end

    return defaultRank
end

function getItemsFromList(items)
    local str = ''
    if #items > 0 then
        for i = 1, #items do
            local itemID = items[i][1]
            local itemName = ItemType(itemID):getName()
            if itemName then
                str = str .. items[i][2] .. ' ' .. itemName
            else
                str = str .. items[i][2] .. ' ' .. "Item ID: " .. itemID
            end
            if i ~= #items then str = str .. ', ' end
        end
    end
    return str
end


function Player:doRemoveItemsFromList(items)
    local count = 0
    if #items > 0 then
        for i = 1, #items do
            if self:getItemCount(items[i][1]) >= items[i][2] then
                count = count + 1
            end
        end
    end
    if count == #items then
        for i = 1, #items do
            self:removeItem(items[i][1], items[i][2])
        end
    else
        return false
    end
    return true
end

function getMonsterFromList(monster)
    local str = ''
    if #monster > 0 then
        for i = 1, #monster do
            str = str .. monster[i]
            if i ~= #monster then str = str .. ', ' end
        end
    end
    return str
end

function Player:giveRewardsTask(items)
    local backpack = self:addItem(1999, 1)
    for _, i_i in ipairs(items) do
        local item, amount = i_i[1], i_i[2]
        if ItemType(item):isStackable() or amount == 1 then
            backpack:addItem(item, amount)
        else
            for i = 1, amount do
                backpack:addItem(item, 1)
            end
        end
    end
end
