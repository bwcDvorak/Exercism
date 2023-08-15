import Foundation

//Solution goes in Sources

struct Queens {
    var white = [0, 3]
    var black = [7, 3]
    
    enum InitError: Error {
        case incorrectNumberOfCoordinates
        case sameSpace
        case invalidCoordinates
    }
    
    init() throws {
        if white.count != 2 || black.count != 2 {
            throw InitError.incorrectNumberOfCoordinates
        }
    }
    
    init(white: [Int], black: [Int]) throws {
        self.white = white
        self.black = black
        
        if white.count > 2 || black.count > 2 {
            throw InitError.incorrectNumberOfCoordinates
        }
        
        if !(Queens.validateCoordinates(white) || Queens.validateCoordinates(black)) {
            throw InitError.invalidCoordinates
        }
        
        if white == black { throw InitError.sameSpace}
    }
    
    private static func validateCoordinates(_ coords: [Int]) -> Bool {
        for coord in coords {
            if coord < 0 || coord > 7 {return false}
        }
        return true
    }
    
    var description: String {
        var returnString = ""
 
        for row in 0...7 {
            for col in 0...7 {
                if row == white[0] && col == white[1] {
                    returnString += "W"
                } else if row == black[0] && col == black[1] {
                    returnString += "B"
                } else {returnString += "_"}
                // need spaces between squares
                if col < 7 {returnString += " "}
            }
            // need line breaks between rows
            if row < 7 {returnString += "\n"}
        }
        
        return returnString
    }
    
    var canAttack: Bool {
        // do they share rows or columns
        if (white[0] == black[0]) || (white[1] == black[1]) {return true}
        
        // now diagonals
        let dx = abs(black[0] - white[0])
        let dy = abs(black[1] - white[1])
        return dx == dy
    }
}
