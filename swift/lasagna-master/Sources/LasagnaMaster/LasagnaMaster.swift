// TODO: define the 'remainingMinutesInOven' function
func remainingMinutesInOven(elapsedMinutes x: Int, expectedMinutesInOven y: Int = 40) -> Int {
    return (y - x)
}

// TODO: define the 'preparationTimeInMinutes' function
func preparationTimeInMinutes(layers x: String...) -> Int {
    let minutes = 2 * x.count
    return minutes
}

// TODO: define the 'quantities' function
func quantities(layers x: String...) -> (noodles: Int, sauce: Double) {
    var needNoodles = 0
    var needSauce   = 0.0
    
    for layer in x {
        switch layer {
        case "noodles":
            needNoodles += 3
        case "sauce":
            needSauce += 0.2
        default:
            continue
        }
    }
    return (needNoodles, needSauce)
}

// TODO: define the 'toOz' function
func toOz(_ amounts: inout (noodles: Int, sauce: Double)) {
    amounts.sauce *= 33.814
}

// TODO: define the 'redWine' function
func redWine(layers x: String...) -> Bool {
    var cheeseCount = 0
    
    for layer in x {
        switch layer {
        case "mozzarella":
            cheeseCount += 1
        case "ricotta":
            cheeseCount += 1
        case "béchamel":
            cheeseCount += 1
        case "meat":
            cheeseCount -= 1
        case "sauce":
            cheeseCount -= 1
        default:
            continue
        }
    }
        
     if cheeseCount <= 0 {
            return true
     } else {
            return false
     }
}
