import Foundation

//Solution goes in Sources

struct Scrabble {
    var score: Int = 0
    
    init(_ input: String?) {
        if let input = input {
            self.score = Scrabble.score(input)
        }
    }
    
    static func score(_ input: String) -> Int {
        var theScore: Int = 0
        
        for char in input.uppercased() {
            switch char {
            case "Q", "Z":
                theScore += 10
            case "J", "X":
                theScore += 8
            case "K":
                theScore += 5
            case "F", "H", "V", "W", "Y":
                theScore += 4
            case "B", "C", "M", "P":
                theScore += 3
            case "D", "G":
                theScore += 2
            case "A", "E", "I", "O", "U", "L", "N", "R", "S", "T":
                theScore += 1
            default:
                continue
            }
        }
        return theScore
    }
    
}
