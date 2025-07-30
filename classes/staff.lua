data = require "data.data"

Staff = { __type = "Staff" }
function Staff:new(o)
    o = o or {}
    o.name = o.name or data.staff.name
    o.wage = o.wage or data.staff.wage
    setmetatable(o, self)
    self.__index = self
    return o
end

ZooKeeper = Staff:new()

ZooKeeper = { __type = data.zoo_keeper.type }
function ZooKeeper:new(o)
    o = Staff:new(self, o)
    o.maxAnimals = o.maxAnimals or data.zoo_keeper.maxAnimals
    o.wage = data.zoo_keeper.wage
    o.assignedAnimals = {}  -- new zoo keepers always comes with no assigned animals
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

Janitor = Staff:new(o)
Janitor = { __type = data.janitor.type }
function Janitor:new(o)
    o = Staff:new(self, o)
    o.wage = data.janitor.wage
    o.maintenancePoints = o.maintenancePoints or data.janitor.maintenancePoints
    return o
end

function Janitor:dailyMaintenance(zoo_manager)
    local maintenance = zoo_manager.dailyMaintenanceNeeded - self.maintenancePoints
    if maintenance > 0 then
        zoo_manager.dailyMaintenanceNeeded = maintenance
    else
        zoo_manager.dailyMaintenanceNeeded = 0
    end
end

return {
    ZooKeeper = ZooKeeper,
    Janitor = Janitor
}
