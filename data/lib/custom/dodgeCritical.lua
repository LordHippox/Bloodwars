DODGE = {
    LEVEL_MAX = 100, -- Maximum dodge level the player can achieve
    PERCENT = 0.2 -- Percentage that will defend the attack [default 50% = 0.5]
}

CRITICAL = {
    LEVEL_MAX = 100, -- Maximum critical level the player can achieve
    PERCENT = 1.0 -- Percentage that will increase the attack [default 50% = 0.5]
}

function Player.getDodgeLevel(self)
    return self:getStorageValue(STORAGEVALUE_DODGE)
end

function Player.setDodgeLevel(self, value)
    return self:setStorageValue(STORAGEVALUE_DODGE, value)
end

function Player.getCriticalLevel(self)
    return self:getStorageValue(STORAGEVALUE_CRITICAL)
end

function Player.setCriticalLevel(self, value)
    return self:setStorageValue(STORAGEVALUE_CRITICAL, value)
end
