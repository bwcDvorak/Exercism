import Foundation

let flip = { (tuple: (a: String, b: String, c:String)) -> (String, String, String) in
    let (a, b, c) = tuple
    return (b, a, c)
}

let rotate = { (tuple: (a: String, b: String, c: String)) -> (String, String, String) in
    let (a, b, c) = tuple
    return (b, c, a)
}

func makeShuffle(flipper: @escaping ((String, String, String)) -> (String, String, String),
                 rotator: @escaping ((String, String, String)) -> (String, String, String))
    -> (UInt8, (String, String, String)) -> (String, String, String)
{
    return { myID, myWires in
        var currentWires = myWires
        var currentID = myID
        
        for _ in 0...7 {
            currentWires = currentID % 2 == 0 ? flipper(currentWires) : rotator(currentWires)
            currentID = currentID / 2
        }
        
        return currentWires
    }
}
