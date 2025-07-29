data = require("data.data")

Visitors = { __type = "Visitors" }

function Visitors:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Visitors:dailyIncome(avg_happiness, num_animals)
    local potential_visitors = num_animals * data.visitors.potentialVisitorsPerAnimal
    local actual_visitors = (potential_visitors * avg_happiness) / 100
    return actual_visitors * data.visitors.entryCost
end

return Visitors
