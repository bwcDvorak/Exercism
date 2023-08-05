import Foundation

//Solution goes in Sources
struct FoodChain {
    
    static func verse(_ input: Int) -> String {
        
        var inputVerse: String = ""
        let creatures = ["", "fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"]
        let expCreatures = ["", "fly.\n", "spider that wriggled and jiggled and tickled inside her.\n", "bird.\n", "cat.\n", "dog.\n", "goat.\n", "cow.\n", "horse.\n"]
        let rhymeLine = ["", "", "It wriggled and jiggled and tickled inside her.\n", "How absurd to swallow a bird!\n", "Imagine that, to swallow a cat!\n", "What a hog, to swallow a dog!\n", "Just opened her throat and swallowed a goat!\n", "I don't know how she swallowed a cow!\n", "She's dead, of course!"]
        
        let line1 = "I know an old lady who swallowed a \(creatures[input]).\n"
        inputVerse.append(line1)
        inputVerse.append(rhymeLine[input])
        if input > 1 && input < 8 {
            for rep in stride(from: input, through: 2, by: -1){
                let nextLine = "She swallowed the \(creatures[rep]) to catch the \(expCreatures[rep - 1])"
                inputVerse.append(nextLine)
            }
        }
        if input < 8 {
            inputVerse.append("I don't know why she swallowed the fly. Perhaps she'll die.")
        }
        return inputVerse
    }
    
    static func song(start: Int, end: Int) -> String {
        var songString: String = ""
        
        guard start >= 1 && start <= 8 && end >= start && end <= 8 else {
            return "Invalid input. Please provide valid verse numbers."
        }
        
        for index in start...end {
            songString.append(verse(index))
            if index < end {
                songString.append("\n\n")
            }
        }
        
        return songString
    }
}
