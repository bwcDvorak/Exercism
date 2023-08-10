class BottleSong {
    var bottles: Int
    
    init(bottles: Int) {
        self.bottles = bottles
    }
    
    let numberToString: [Int: String] = [
        1: "one",
        2: "two",
        3: "three",
        4: "four",
        5: "five",
        6: "six",
        7: "seven",
        8: "eight",
        9: "nine",
        10: "ten"
    ]
    
    func capitalizeFirstLetter(_ input: String) -> String {
        return input.prefix(1).uppercased() + input.dropFirst()
    }
    
    func reciteNumber(_ number: Int) -> String {
        return numberToString[number] ?? "no"
    }
    
    func reciteVerse(_ number: Int) -> [String] {
        let numberString = reciteNumber(number)
        let bottleString = "\(numberString) green bottle\(number > 1 ? "s" : "") hanging on the wall,"
        return [
            "\(capitalizeFirstLetter(bottleString))",
            "\(capitalizeFirstLetter(bottleString))",
            "And if one green bottle should accidentally fall,",
            "There'll be \(reciteNumber(number - 1)) green bottle\(number - 1 == 1 ? "" : "s") hanging on the wall."
        ]
    }
    
    func song(takedown: Int) -> [String] {
        var verses: [String] = []
        for number in stride(from: bottles, through: bottles - takedown + 1, by: -1) {
            verses.append(contentsOf: reciteVerse(number))
            verses.append("")  // Insert an empty string between verses
        }
        bottles -= takedown
        
        if verses.last == "" {
            verses.removeLast()  // Remove the final empty string
        }
        
        return verses
    }
}
