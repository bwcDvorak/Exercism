func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
    let monthlyPayment = price / 60

   if monthlyPayment > (monthlyBudget + 10) {
        return "Darn! No " + vehicle + " for me"                                   
    } else if monthlyPayment < monthlyBudget {
        return "Yes! I'm getting a " + vehicle                                     
    } else {
        return "I'll have to be frugal if I want a " + vehicle                                            
    }
}

func licenseType(numberOfWheels wheels: Int) -> String {
    switch wheels {
        case 2:
            return "You will need a motorcycle license for your vehicle"
        case 3:
            return "You will need a motorcycle license for your vehicle"
        case 4:
            return "You will need an automobile license for your vehicle"
        case 6:
            return "You will need an automobile license for your vehicle"
        case 18:
            return "You will need a commercial trucking license for your vehicle" 
        default:
            return "We do not issue licenses for those types of vehicles"
    }
}

func registrationFee(msrp: Int, yearsOld: Int) -> Int {
    var baseCost = 25000.0
    
    if yearsOld >= 10 {
        return 25               
    }

    if msrp > Int(baseCost) {
        baseCost = Double(msrp)
    } 

    // rather than divide by 10 and 100, just div by 1000
    let ageDiscount = (10.0 - (Double(yearsOld))) / 1000.0

    return Int(baseCost * ageDiscount)
}
