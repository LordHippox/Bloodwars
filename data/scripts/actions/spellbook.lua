local spellbook = Action()

function spellbook.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local text = {}
    local spells = {}
    
    -- Collect instant spells available to the player
    for _, spell in ipairs(player:getInstantSpells()) do
        -- Check if the spell level is not zero and if it consumes mana
        if spell.level ~= 0 and spell.manapercent > 0 then
            spell.mana = spell.manapercent .. "%"
            spells[#spells + 1] = spell
        end
    end

    -- Sort spells by their level
    table.sort(spells, function(a, b) return a.level < b.level end)

    local prevLevel = -1
    for i, spell in ipairs(spells) do
        if prevLevel ~= spell.level then
            if i == 1 then
                text[#text == nil and 1 or #text + 1] = "Spells for Level "
            else
                text[#text + 1] = "\nSpells for Level "
            end
            text[#text + 1] = spell.level .. "\n"
            prevLevel = spell.level
        end
        text[#text + 1] = spell.words .. " - " .. spell.name .. " : " .. spell.mana .. "\n"
    end

    -- Display the collected spell information in a text dialog
    player:showTextDialog(item:getId(), table.concat(text))
    return true
end

spellbook:id(2175, 6120, 8900, 8901, 8902, 8903, 8904, 8918)
spellbook:register()
