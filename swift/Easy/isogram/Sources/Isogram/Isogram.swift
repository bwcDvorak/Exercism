import Foundation

//Solution goes in Sources

struct Isogram {
    
    static func isIsogram(_ input: String) -> Bool {

        guard (input.range(of: "([A-Za-z])", options: .regularExpression) != nil) else {
            // if no letters found, return true and skip later tests
            return true
        }

        // trim out non letters which are allowed
        let allowed: Set<Character> = [" ", "-"]
        var trimmedString = input
        trimmedString.removeAll(where: {allowed.contains($0)})

        // then lowercase for simplicity
        trimmedString = trimmedString.lowercased()
        
        var alreadySeen: Set<Character> = []
        for char in trimmedString {
            // if adding a char to alreadySeen fails, it's a dupe
            if !alreadySeen.insert(char).inserted {
                return false
            }
        }
        
    // if we passed all previous tests, return true.
    return true
    }
}
