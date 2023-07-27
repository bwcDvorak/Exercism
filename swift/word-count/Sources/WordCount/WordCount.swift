import Foundation

//Solution goes in Sources

struct WordCount {
    private var words: [String]
    
    init(words input: String) {
        // Define the character set containing all allowed characters (lowercase letters, apostrophes, numbers)
        let allowedCharacterSet = CharacterSet(charactersIn: "1234567890abcdefghijklmnopqrstuvwxyz'")
     
        // Convert the input string to lowercase
        let lowercaseInput = input.lowercased()
        
        // Remove all characters not present in the allowedCharacterSet
        let filteredInput = lowercaseInput.unicodeScalars.filter { allowedCharacterSet.contains($0) }
        
        // Split the input string into an array of words using whitespace as the delimiter
        let wordsArray = lowercaseInput.components(separatedBy: CharacterSet.whitespacesAndNewlines)
        
        // Split the cleaned input string into an array of words using whitespace as the delimiter
         self.words = wordsArray.map { $0.unicodeScalars.filter { allowedCharacterSet.contains($0) } }
            .map { String($0) }
            .filter { !$0.isEmpty }
    }
    
    func count() -> [String: Int] {
        // Create a dictionary to store the word count
        var wordCountDictionary: [String: Int] = [:]
        
        // Count the occurrences of each word
        for word in words {
            wordCountDictionary[word, default: 0] += 1
        }
        
        return wordCountDictionary
    }
}
