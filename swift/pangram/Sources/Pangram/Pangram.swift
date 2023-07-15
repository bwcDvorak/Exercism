import Foundation

//Solution goes in Sources

struct Pangram {
    static func isPangram(_ input: String) -> Bool {
        
        // sets don't care about order
        // sets don't allow dupe entries - advantage here
        // sets perform better when you're checking membership
        // arrays perform better if you'll do lots of adds/removes/alters
        let alphabetSet: Set<Character> = Set("abcdefghijklmnopqrstuvwxyz")
        let lowercaseInput = input.lowercased()
        let inputSet = Set(lowercaseInput)
        
        return alphabetSet.isSubset(of: inputSet)
    }
}
