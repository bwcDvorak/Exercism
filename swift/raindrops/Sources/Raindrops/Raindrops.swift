import Foundation

//Solution goes in Sources
struct Raindrops {
    var myInt = 0
    
    init (_ input: Int) {
        self.myInt = input
    }
    
    var sounds: String {
        var returnString = ""
        
        let divThree    = (myInt % 3) == 0
        let divFive     = (myInt % 5) == 0
        let divSeven    = (myInt % 7) == 0

        if divThree {
            returnString += "Pling"
        }
        
        if divFive {
            returnString += "Plang"
        }

        if divSeven {
            returnString += "Plong"
        }
        
        if !( divThree || divFive || divSeven) {
            returnString = String(myInt)
        }

        return returnString
    }
    
}
