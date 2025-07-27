data = require "data.data"

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
    animal.zoo_keeper = self
end

function ZooKeeper:feed(animal, zoo_manager)
    local pay = zoo_manager:pay(animal.feedingCost)
    if pay then
        animal.needsFood = false
    end
end

function ZooKeeper:clean(animal)
    animal.needsCleaning = false
end

function ZooKeeper:checkAnimals(zoo_manager)
    for i, animal in ipairs(self.assignedAnimals) do
        if animal.needsCleaning then
            self:clean(animal)
        end

        if animal.needsFood then
            self:feed(animal, zoo_manager)
        end
    end
end

return {
    ZooKeeper = ZooKeeper
}
