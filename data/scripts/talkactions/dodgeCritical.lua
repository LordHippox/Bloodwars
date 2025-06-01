local dodgeCmd = TalkAction("!dodge")
local criticalCmd = TalkAction("!critical")

function sendPopupFYI(player, message)
    player:popupFYI(message)
end

function dodgeCmd.onSay(player, words, param)
    local skill = player:getDodgeLevel()
    local message = [[
DODGE SYSTEM
Dodge will defend 1% of attacks.

For Example:
Every stone you use will add 0.3% chance.
With 10 stones, you will have 3% chance to defend against 50% of attacks.
With 100 stones (max), you will have 30% chance to defend against 50% of attacks.
Every stone you use will upgrade 1 level of dodge.

------------------
Dodge Skill: []] .. skill .. [[/100]
]]
    sendPopupFYI(player, message)
end

dodgeCmd:register()

function criticalCmd.onSay(player, words, param)
    local skill = player:getCriticalLevel()
    local message = [[
CRITICAL SYSTEM
With 10 stones, you have a 3% chance to hit opponents.
With 100 stones (max), you will have a 30% critical chance.
1 stone will increase 1 level of critical.

------------------
Critical Skill: []] .. skill .. [[/100]
]]
    sendPopupFYI(player, message)
end

criticalCmd:register()