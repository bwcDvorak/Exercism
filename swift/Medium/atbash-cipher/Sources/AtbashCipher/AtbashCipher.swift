import Foundation

class AtbashCipher {
    // Write your code for the 'AtbashCipher' exercise in this file.
    static func encode(_ phrase: String) -> String {
        let lowercaseAlphabets = Array("abcdefghijklmnopqrstuvwxyz")
        
        // Remove spaces from the input string and convert to lowercase
        let cleanedInput = phrase.lowercased().filter { !$0.isWhitespace }
        
        var encodedPhrase = ""
        
        // Helper function to encode a character
        func encodeCharacter(_ char: Character) -> String {
            if char.isLetter {
                // Calculate the ASCII value of the character
                let asciiValue = char.asciiValue!
                let aAsciiValue = Character("a").asciiValue!
                
                // Calculate the index in the reversed alphabets array
                let reversedIndex = Int(aAsciiValue) + Int(lowercaseAlphabets.count) - Int(asciiValue - aAsciiValue) - 1
                
                // Get the encoded character
                return String(UnicodeScalar(reversedIndex)!)
            } else if char.isNumber {
                return String(char)
            } else {
                return ""
            }
        }
        
        var groupLength = 0
        
        for char in cleanedInput {
            let encodedChar = encodeCharacter(char)
            
            if !encodedChar.isEmpty {
                encodedPhrase += encodedChar
                groupLength += 1
                
                // Add a space after every 5 characters or if the character is not a letter/number
                if groupLength == 5 {
                    encodedPhrase += " "
                    groupLength = 0
                }
            }
        }
        
        // Remove any trailing space
        if encodedPhrase.last == " " {
            encodedPhrase.removeLast()
        }
        
        return encodedPhrase
    }

    static func decode(_ phrase: String) -> String {
        // Use the encode() function to get the encoded string
        let encodedString = encode(phrase)
        
        // Remove spaces from the encoded string and return the result
        let decodedString = encodedString.filter { !$0.isWhitespace }
        return decodedString
    }
}
