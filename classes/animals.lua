data = require "data"

Animal = { __type = "Animal" }

function Animal:new(o)
    o = o or {}
    o.name = o.name or data.default.name
    o.needsFood = o.needsFood or false
    o.needsCleaning = o.needsCleaning or false
    o.cleaningInterval = o.cleaningInterval or data.default.cleaningInterval
    o.eatingInterval = o.eatingInterval or data.default.eatingInterval
    o.feedingCost = o.feedingCost or data.default.feedingCost
    o.happiness = o.happiness or data.default.happiness
    setmetatable(o, self)
    self.__index = self
    return o
end

Elephant = Animal:new()
Elephant.__type = data.animals.elephant
function Elephant:new(o)
    o = Animal.new(self, o)
    o.cleaningInterval = data.elephant.cleaningInterval
    o.eatingInterval = data.elephant.eatingInterval
    o.feedingCost = data.elephant.feedingCost
    return o
end

Tiger = Animal:new()
Tiger.__type = data.animals.tiger
function Tiger:new(o)
    o = Animal.new(self, o)
    o.cleaningInterval = data.tiger.cleaningInterval
    o.eatingInterval = data.tiger.eatingInterval
    o.feedingCost = data.tiger.feedingCost
    return o
end

return {
    Animal = Animal,
    Elephant = Elephant,
    Tiger = Tiger
}
