local function randomName()
    -- Create a random name
    return "Random Name"
end

local zooData = {

    animals = {
        elephant = "elephant",
        tiger = "tiger"
    },

    default = {
        name = "Unnamed",
        cleaningInterval = 5,
        eatingInterval = 5,
        feedingCost = 30,
        happiness = 100,
        startingCash = 500,
        startingDay = 0,
        runAwayFine = 5000,
        dailyRent = 1000,
        condition = 1000
    },

    visitors = {
        entryCost = 25,
        potentialVisitorsPerAnimal = 20,

    },

    elephant = {
        cleaningInterval = 12,
        eatingInterval = 12,
        feedingCost = 25
    },

    tiger = {
        cleaningInterval = 24,
        eatingInterval = 5,
        feedingCost = 40
    },

    staff = {
        name = randomName(),
        wage = 50
    },

    zoo_keeper = {
        type = "ZooKeeper",
        maxAnimals = 2,
        wage = 50,

        error_msg = {
            max_animals_reached = "This ZooKeeper cannot take care of any more animals."
        }
    },

    janitor = {
        type = "Janitor",
        wage = 50,
        maintenancePoints = 100,
    }
}

return zooData
