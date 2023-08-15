import Foundation

//Solution goes in Sources

struct Robot {
    // this robot's name
    var name: String = ""
    // array of all robot names, to check for dupes
    static var currentNames: [String] = []
    
    init() {
        generateName()
    }
    
    mutating func resetName() {
        self.name = ""
    }
    
    func generateTwoRandomLetters() -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let randomIndex1 = Int.random(in: 0..<letters.count)
        let randomIndex2 = Int.random(in: 0..<letters.count)
        
        let randomLetter1 = letters[letters.index(letters.startIndex, offsetBy: randomIndex1)]
        let randomLetter2 = letters[letters.index(letters.startIndex, offsetBy: randomIndex2)]
        
        return String(randomLetter1) + String(randomLetter2)
    }
    
    func generateThreeRandomDigits() -> String {
        let randomNumber = Int.random(in: 100...999)
        return String(randomNumber)
    }
    
    mutating func generateName() {
        while self.name == "" {
            let newName = generateTwoRandomLetters() + generateThreeRandomDigits()
            
            while !Robot.currentNames.contains(newName) {
                Robot.currentNames.append(newName)
                self.name = newName
            }
        }
    }
}
