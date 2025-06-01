local talk = TalkAction("!autoloot")

function talk.onSay(player, words, param)
    local split = param:split(",")

    local action = split[1]

    -- Handle adding an item to the auto loot list
    if action == "add" then
        local item = split[2]:gsub("%s+", "", 1)
        local itemType = ItemType(item)
        if not itemType or itemType:getId() == 0 then
            itemType = ItemType(tonumber(item))
            if not itemType or itemType:getId() == 0 then
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "No item found with that ID or name.")
                return false
            end
        end

        local itemName = tonumber(split[2]) and itemType:getName() or item
        local size = 0
        for i = AUTOLOOT_STORAGE_START, AUTOLOOT_STORAGE_END do
            local storage = player:getStorageValue(i)
            if size == AUTO_LOOT_MAX_ITEMS then
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Your list is full, remove an item to add a new one.")
                break
            end

            if storage == itemType:getId() then
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, itemName .. " is already in your list.")
                break
            end

            if storage <= 0 then
                player:setStorageValue(i, itemType:getId())
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, itemName .. " has been added to your list.")
                break
            end

            size = size + 1
        end
    -- Handle removing an item from the auto loot list
    elseif action == "remove" then
        local item = split[2]:gsub("%s+", "", 1)
        local itemType = ItemType(item)
        if itemType:getId() == 0 then
            itemType = ItemType(tonumber(item))
            if itemType:getId() == 0 then
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "No item found with that ID or name.")
                return false
            end
        end

        local itemName = tonumber(split[2]) and itemType:getName() or item
        for i = AUTOLOOT_STORAGE_START, AUTOLOOT_STORAGE_END do
            if player:getStorageValue(i) == itemType:getId() then
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, itemName .. " has been removed from your list.")
                player:setStorageValue(i, 0)
                return false
            end
        end

        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, itemName .. " was not found in your list.")
    -- Handle listing items in the auto loot list
    elseif action == "list" then
        local text = "-- Auto Loot List --\n"
        local count = 1
        for i = AUTOLOOT_STORAGE_START, AUTOLOOT_STORAGE_END do
            local storage = player:getStorageValue(i)
            if storage > 0 then
                text = string.format("%s%d. %s\n", text, count, ItemType(storage):getName())
                count = count + 1
            end
        end

        if text == "" then
            text = "Empty"
        end
   
        player:showTextDialog(1950, text, false)
    -- Handle clearing the auto loot list
    elseif action == "clear" then
        for i = AUTOLOOT_STORAGE_START, AUTOLOOT_STORAGE_END do
            player:setStorageValue(i, 0)
        end

        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "The auto loot list has been cleared.")
    -- Handle toggling auto loot for gold
    elseif action == "gold" then
        if player:getStorageValue(AUTOLOOT_STORAGE_GOLD) == 1 then
            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Auto loot for gold has been disabled.")
            player:setStorageValue(AUTOLOOT_STORAGE_GOLD, -1)
        else
            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Auto loot for gold has been enabled.")
            player:setStorageValue(AUTOLOOT_STORAGE_GOLD, 1)
        end
    else
        -- Display available commands for auto loot
        player:popupFYI("Below are the available Auto Loot commands:\n\n!autoloot gold\n!autoloot list\n!autoloot add, itemname\n!autoloot remove, itemname\n!autoloot clear")
    end

    return false
end

talk:separator(" ")
talk:register()
