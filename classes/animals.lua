data = require "data.data"

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
    o.zoo_keeper = o.zoo_keeper or nil
    setmetatable(o, self)
    self.__index = self
    return o
end

function Animal:dailyTick(zoo_manager)
    local ran_away = false

    if self.needsFood then
        self.happiness = self.happiness - self.eatingInterval
    end

    if self.happiness < 50 then
        ran_away = true
        print(self.name .. " ran away!")

        -- Delete animal from zoo manager
        for i, animal in ipairs(zoo_manager.animals) do
            if animal == self then
                table.remove(zoo_manager.animals, i)
            end
        end

        -- Delete animal from zoo keeper
        if self.zoo_keeper ~= nil then
            -- animal have a keeper
            for i, zoo_keeper in ipairs(zoo_manager.zoo_keepers) do
                if zoo_keeper == self.zoo_keeper then
                    for j, animal in ipairs(zoo_keeper.assignedAnimals) do
                        if animal == self then
                            table.remove(zoo_keeper.assignedAnimals, j)
                        end
                    end
                end
            end
        end
    end

    self.needsFood = true
    self.needsCleaning = true
    return ran_away
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
