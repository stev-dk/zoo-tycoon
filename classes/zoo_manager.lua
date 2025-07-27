data = require "data.data"

ZooManager = { __type = "ZooManager" }

function ZooManager:create(this)
    this = this or {}
    this.name = "Zoo World"
    this.animals = {}
    this.zoo_keepers = {}
    this.money = data.default.startingCast
    setmetatable(this, self)
    self.__index = self
    return this
end

function ZooManager:pay(amount)
    if self.money >= amount then
        self.money = self.money - amount
        return true
    else
        return false
    end
end

function ZooManager:addZooKeeper(zoo_keeper)
    table.insert(self.zoo_keepers, zoo_keeper)
end

function ZooManager:addAnimal(animal)
    table.insert(self.animals, animal)
end

function ZooManager:dailyReport()
    print("Gold: " .. self.money)
end

function ZooManager:dailyRoutine()
    -- ZooKeepers Checks Animals
    for i, zoo_keeper in ipairs(self.zoo_keepers) do
        zoo_keeper:checkAnimals(self)
    end

    -- Animals Ticks
    io.write("Current animals in zoo: ")
    for i, animal in ipairs(self.animals) do
        animal:dailyTick(self)
        io.write(animal.name .. ", ")
    end
    print("\n")

    -- Daily income
    self.money = self.money + 0
end

return ZooManager
