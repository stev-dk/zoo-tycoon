-- Zoo Tycoon Minigame
debugger = require "debugger"
Class = require "classes"

elephant = Class.Elephant:new({name="Arnold"})
tiger = Class.Tiger:new({name="Tigerdyr", needsFood = true})

debugger.animal_data(elephant)
debugger.animal_data(tiger)
