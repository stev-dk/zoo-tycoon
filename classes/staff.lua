data = require "data"

ZooKeeper = { __type = data.zoo_keeper.type }
function ZooKeeper:new(o)
    o = o or {}
    o.name = o.name or data.zoo_keeper.name
    o.maxAnimals = o.maxAnimals or data.zoo_keeper.maxAnimals
    o.wage = o.wage or data.zoo_keeper.wage
    o.assignedAnimals = {}  -- new zoo keepers always comes with no assigned animals
    setmetatable(o, self)
    self.__index = self
    return o
end

function ZooKeeper:assignAnimal(animal)
    -- Add check if animal is a valid animal instance
    if #self.assignedAnimals >= self.maxAnimals then
        print(data.zoo_keeper.error_msg.max_animals_reached)
        return
    end

    table.insert(self.assignedAnimals, animal)
end

function ZooKeeper:feed(animal)
    local money = 1000 -- add ZooManager to keep track of money
    if money >= animal.feedingCost then
        money = money - animal.feedingCost -- add this logic to ZooManager, perhaps even the if statement
        animal.needsFood = false
    end
end

function ZooKeeper:clean(animal)
    animal.needsCleaning = false
end

function ZooKeeper:checkAnimals()
    for i, animal in ipairs(self.assignedAnimals) do
        if animal.needsCleaning then
            self:clean(animal)
        end

        if animal.needsFood then
            self:feed(animal)
        end
    end
end

return {
    ZooKeeper = ZooKeeper
}
