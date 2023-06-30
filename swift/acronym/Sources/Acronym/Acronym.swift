import Foundation

//Solution goes in Sources

struct Acronym {
    
    static func abbreviate (_ input: String) -> String {
        let modifiedString = input
        
        // cut existing TLAs down to initial letters (aka the "PHP" test case)
        .replacingOccurrences(
                of: "([A-Z])([A-Z]{2})",
                with: "$1",
                options: .regularExpression,
                range: nil
            )
        // insert spaces before remaining capitals
            .replacingOccurrences(of: "([A-Z])", with: " $1", options: .regularExpression)
        // strip non-alphanumerics
            .components(separatedBy: CharacterSet.alphanumerics.inverted)
            .joined(separator: " ")
        // uppercase
            .uppercased()
        
        // break strings into words
        let words = modifiedString.components(separatedBy: CharacterSet.whitespaces)
        // concatenate first letter of each word
        let firstLetters = words.map { String($0.prefix(1)) }
        // reassemble into string
        let result = firstLetters.joined()
        
        return result
    }
}
