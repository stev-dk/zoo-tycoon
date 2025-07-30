-- Zoo Tycoon Minigame
debugger = require "debugger"
animals = require "classes.animals"
staff = require "classes.staff"
zoo_manager = require "classes.zoo_manager"

zoo = zoo_manager:create()

elephant = animals.Elephant:new({name="Arnold"})
tiger = animals.Tiger:new({name="Tigerdyr", needsFood = true})
tiger2 = animals.Tiger:new({name="Tigerdyr2", needsFood = true})

zoo_keeper = staff.ZooKeeper:new()
janitor = staff.Janitor:new()
zoo:addZooKeeper(zoo_keeper)
zoo:addJanitor(janitor)
zoo_keeper:assignAnimal(elephant)
zoo_keeper:assignAnimal(tiger)
zoo:addAnimal(elephant)
zoo:addAnimal(tiger)
zoo:addAnimal(tiger2)

debugger.zoo_keeper(zoo_keeper)

-- game loop
while zoo.money >= 0 do
    zoo:dailyRoutine()
    zoo:dailyReport()
end

print("You ran out of money, and lost!")
