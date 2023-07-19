import Foundation

//Solution goes in Sources

struct RotationalCipher {
    
    static func rotate(_ input: String, ROT: Int) -> String {
        
        let letters = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        
        let encoded = input.map { character -> Character in
            guard let index = letters.firstIndex(of: character) else {
                return character
            }
            let isUppercase = index >= 26
            let rotatedIndex = (index + ROT) % 26 + (isUppercase ? 26 : 0)
            return letters[rotatedIndex]
        }
        
        return String(encoded)
    }
}
