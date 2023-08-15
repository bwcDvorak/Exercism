func timeToPrepare(drinks: [String]) -> Double {
    var prepTime = 0.0
    
    for drink in drinks {
        switch drink {
        case "beer":
            prepTime += 0.5
        case "soda":
            prepTime += 0.5
        case "water":
            prepTime += 0.5
        case "shot":
            prepTime += 1.0
        case "mixed drink":
            prepTime += 1.5
        case "fancy drink":
            prepTime += 2.5
        case "frozen drink":
            prepTime += 3.0
        default:
            continue
        }
    }

    return prepTime
}

func makeWedges(needed: Int, limes: [String]) -> Int {
    var myLimes = limes
    var myWedges = 0
    var limeCount = 0
    
    while (myLimes.count != 0) && (myWedges < needed) {
        switch myLimes[0] {
            case "small":
                myWedges += 6
                limeCount += 1
            case "medium":
                myWedges += 8
                limeCount += 1
            case "large":
                myWedges += 10
                limeCount += 1
            default:
                break
            }
        myLimes.removeFirst()
        }
    return limeCount
}

func finishShift(minutesLeft: Int, remainingOrders: [[String]]) -> [[String]] {
    var minutesLeft = Double(minutesLeft)
    var remainingOrders = remainingOrders
    
    repeat {
        minutesLeft -= timeToPrepare(drinks: remainingOrders[0])
        remainingOrders.removeFirst()
    } while minutesLeft > 0 && remainingOrders.count > 0
    
    return remainingOrders
}

func orderTracker(orders: [(drink: String, time: String)]) -> (
  beer: (first: String, last: String, total: Int)?, soda: (first: String, last: String, total: Int)?
) {
    var myBeerStats: (first: String, last: String, total: Int)? = (first: "", last: "", 0)
    var mySodaStats: (first: String, last: String, total: Int)? = (first: "", last: "", 0)

    for myOrder in orders {
        switch myOrder.drink {
        case "beer":
                if (myBeerStats?.first == "") {
                    myBeerStats?.first = myOrder.time
                }
                myBeerStats?.total += 1
                myBeerStats?.last = myOrder.time
        case "soda":
            if (mySodaStats?.first == "") {
                mySodaStats?.first = myOrder.time
            }
            mySodaStats?.total += 1
            mySodaStats?.last = myOrder.time
        default:
            break
        }
    }
    
    if (myBeerStats?.total == 0) {
        myBeerStats = nil
    }
    if (mySodaStats?.total == 0) {
        mySodaStats = nil
    }
    
    return (myBeerStats, mySodaStats)
}
