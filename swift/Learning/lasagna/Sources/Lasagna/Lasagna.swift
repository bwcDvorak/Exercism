let expectedMinutesInOven: Int = 40

func remainingMinutesInOven(elapsedMinutes x: Int) -> Int {
    return Lasagna.expectedMinutesInOven - x
}

func preparationTimeInMinutes(layers x: Int) -> Int {
    return x * 2
}

func totalTimeInMinutes(layers x: Int, elapsedMinutes y: Int) -> Int {
    return preparationTimeInMinutes(layers: x) + y
}
