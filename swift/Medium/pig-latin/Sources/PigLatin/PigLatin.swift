class PigLatin {
    static func translate(_ input: String) -> String {
        return input.split(separator: " ").map { translateWord(String($0)) }.joined(separator: " ")
    }
    
    private static func translateWord(_ word: String) -> String {
        let vowels = "aeiou"
        
        // Treat "y" as a consonant at the beginning of a word, otherwise as a vowel.
        let yTreatedAsVowel = word.prefix(1) != "y"
        
        if let firstChar = word.first {
            // If word starts with a vowel or certain combinations
            if vowels.contains(firstChar) || ["xr", "yt"].contains(word.prefix(2)) {
                return word + "ay"
            } else if word.hasPrefix("qu") {
                return String(word.dropFirst(2)) + "quay"
            } else {
                for (index, char) in word.enumerated() {
                    if vowels.contains(char) || (char == "y" && yTreatedAsVowel) {
                        // Special case for "qu" preceded by a consonant
                        if char == "u" && index > 0 && word[word.index(word.startIndex, offsetBy: index-1)] == "q" {
                            return String(word.suffix(from: word.index(word.startIndex, offsetBy: index+1))) + String(word.prefix(through: word.index(word.startIndex, offsetBy: index))) + "ay"
                        }
                        return String(word.suffix(from: word.index(word.startIndex, offsetBy: index))) + String(word.prefix(upTo: word.index(word.startIndex, offsetBy: index))) + "ay"
                    }
                }
            }
        }
        // If no vowels or in other edge cases, return the original word
        return word
    }
}
