// Solution goes in Sources
struct Cipher {
    let key: String
    
    // Initialize the struct with a custom key.
    // If the key is empty or contains non-alphabetic characters, return nil.
    init?(key: String) {
        if key.isEmpty || key.contains(where: { !("a"..."z").contains($0) }) {
            return nil
        }
        self.key = key
    }
    
    // Initialize the struct with a randomly generated key.
    init() {
        let alphabetArray = Array("abcdefghijklmnopqrstuvwxyz")
        key = String((0..<100).map { _ in
            alphabetArray.randomElement()!
        })
    }
    
    // Encode the given text using the key.
    // The Caesar cipher algorithm is applied, shifting characters based on the key.
    func encode(_ text: String) -> String {
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
        let encodedScalars = text.enumerated().map { (index, char) in
            let shift = alphabet.firstIndex(of: key[key.index(key.startIndex, offsetBy: index)])!
            let charIndex = alphabet.firstIndex(of: char)!
            let encodedIndex = (charIndex + shift) % alphabet.count
            return alphabet[encodedIndex]
        }
        return String(encodedScalars)
    }
    
    // Decode the given code using the key.
    // Reverse the Caesar cipher algorithm to retrieve the original text.
    func decode(_ code: String) -> String {
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
        let decodedScalars = code.enumerated().map { (index, char) in
            let shift = alphabet.firstIndex(of: key[key.index(key.startIndex, offsetBy: index)])!
            let charIndex = alphabet.firstIndex(of: char)!
            let decodedIndex = (charIndex - shift + alphabet.count) % alphabet.count
            return alphabet[decodedIndex]
        }
        return String(decodedScalars)
    }
}
