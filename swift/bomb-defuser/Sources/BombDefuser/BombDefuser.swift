import Foundation

let flip = { (tuple: (a: String, b: String, c:String)) -> (String, String, String) in
    let (a, b, c) = tuple
    return (b, a, c)
}

let rotate = { (tuple: (a: String, b: String, c: String)) -> (String, String, String) in
    let (a, b, c) = tuple
    return (b, c, a)
}

func makeShuffle(
  flipper: @escaping ((String, String, String)) -> (String, String, String),
  rotator: @escaping ((String, String, String)) -> (String, String, String)
) -> (UInt8, (String, String, String)) -> (String, String, String) {
    
    return { (myID: UInt8, myWires: (String, String, String)) -> (String, String, String) in
        var myWires = myWires
        var myID = myID
        var counter = 0
        
        while counter <= 7 {
        myWires = myID % 2 == 0 ? flipper(myWires) : rotator(myWires)
        myID = myID / 2
        counter += 1
        }
        return myWires
    }
}
