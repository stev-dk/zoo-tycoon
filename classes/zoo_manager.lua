data = require "data.data"
visitors = require "classes.visitors"

visitors_class = visitors:new()

ZooManager = { __type = "ZooManager" }

function ZooManager:create(this)
    this = this or {}
    this.name = "Zoo World"
    this.animals = {}
    this.zoo_keepers = {}
    this.money = data.default.startingCash
    this.startingDay = data.default.startingDay
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
    local unhappy_animals = {}
    local total_happiness = 0
    for i, animal in ipairs(self.animals) do
        total_happiness = total_happiness + animal.happiness
        if animal.happiness < 100 then
            table.insert(unhappy_animals, animal)
        end
    end

    local average_happiness = (total_happiness / #self.animals)

    -- DAILY INCOME
    local daily_income = visitors_class:dailyIncome(average_happiness, #self.animals)
    print("-----------------------------------------\nDaily income: " .. daily_income)
    self.money = self.money + daily_income

    self.startingDay = self.startingDay + 1
    print(string.format("Day: %d - Money: %d", self.startingDay, self.money))

    if #unhappy_animals > 0 then
        print(string.format("Unhappy animals: %d - Average happiness %d", #unhappy_animals, average_happiness))
    end
end

function ZooManager:dailyRoutine()
    -- ZooKeepers Checks Animals
    for i, zoo_keeper in ipairs(self.zoo_keepers) do
        zoo_keeper:checkAnimals(self)
        self:pay(zoo_keeper.wage)
    end

    -- Animals Ticks
    for i, animal in ipairs(self.animals) do
        local ran_away = animal:dailyTick(self)
        -- If animal runs away
        if ran_away then
            io.write("You payed a fine of " .. data.default.runAwayFine .. "$\n")
            self.money = self.money - data.default.runAwayFine
        end
    end
end

return ZooManager
