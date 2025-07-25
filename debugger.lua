-- DEBUGER FUNCTIONS

function animal_description(animal)
    local name = animal.name
    local animal_type = getmetatable(animal).__type
    print(string.format("%s the %s is hungry: %s", name, animal_type, tostring(animal.needsFood)))
    print(string.format("A %s should be fed every %d hours", animal_type, animal.eatingInterval))
    print(string.format("A %s's enclosure should be cleaned every %d hours", animal_type, animal.cleaningInterval))
    print(string.format("Happiness: %d", animal.happiness))
end

function animal_data(animal)
    local name = animal.name
    local animal_type = getmetatable(animal).__type
    print(string.format("%s is a(n) %s", name, animal_type))
    print(string.format("Eating interval: %d", animal.eatingInterval))
    print(string.format("Cleaning interval: %d", animal.cleaningInterval))
    print(string.format("Happiness: %d", animal.happiness))
    print(string.format("Needs cleaning: %s Needs food: %s", tostring(animal.needsCleaning), tostring(animal.needsFood)))
end

return {
    animal_description = animal_description,
    animal_data = animal_data
}
