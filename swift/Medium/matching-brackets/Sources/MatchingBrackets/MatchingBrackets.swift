public struct MatchingBrackets {
    /// Determines if text has matching brackets.
    public static func paired(text: String) -> Bool {
        var stack: [Character] = []
        
        // Maps opening brackets to their corresponding closing brackets.
        let brackets: [Character: Character] = ["(": ")", "{": "}", "[": "]"]

        for char in text {
            if brackets.keys.contains(char) {
                stack.append(char)  // Push opening brackets onto the stack.
            } else if brackets.values.contains(char) {
                // Check if closing bracket matches the latest opening bracket.
                if stack.isEmpty || char != brackets[stack.popLast()!] {
                    return false
                }
            }
        }

        // Return true if all brackets were matched.
        return stack.isEmpty
    }
}
