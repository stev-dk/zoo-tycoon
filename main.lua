-- Zoo Tycoon Minigame
debugger = require "debugger"
animals = require "classes/animals"
staff = require "classes/staff"

elephant = animals.Elephant:new({name="Arnold"})
tiger = animals.Tiger:new({name="Tigerdyr", needsFood = true})
tiger2 = animals.Tiger:new({name="Tigerdyr2", needsFood = true})

zoo_keepr = staff.ZooKeeper:new()
zoo_keepr:assignAnimal(elephant)
zoo_keepr:assignAnimal(tiger)

debugger.animal_data(elephant)
debugger.animal_data(tiger)

zoo_keepr:checkAnimals()

debugger.animal_data(elephant)
debugger.animal_data(tiger)
--debugger.zoo_keeper(zoo_keepr)
