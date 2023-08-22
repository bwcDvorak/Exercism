import Foundation

struct Bob {

    static func response(_ input: String) -> String {
        // Trim any whitespace or newline characters from the beginning and end
        let trimmedString = input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Remove diacritics from the input.
        let sanitizedString = trimmedString.folding(options: .diacriticInsensitive, locale: .current)
        
        // If the sanitized input is empty, Bob perceives it as being addressed
        if sanitizedString.isEmpty {
            return Replies.passiveAggress.rawValue
        }
        
        // Check if the sanitized input ends with a '?', which would indicate a question.
        let isQuestion = sanitizedString.last == "?"
        
        // Check if the sanitized input contains any alphabetical characters.
        let containsLetters = sanitizedString.range(of: "[A-Za-z]", options: .regularExpression) != nil
        
        // Determine if the sanitized input is 'yelled' by checking if it has letters
        // and if it's the same when converted entirely to uppercase.
        let isYelled = containsLetters && sanitizedString == sanitizedString.uppercased()

        // Switch based on the properties of the input to determine Bob's response.
        switch true {
        case isQuestion && isYelled:
            return Replies.yelledQuestion.rawValue
        case isQuestion:
            return Replies.question.rawValue
        case isYelled:
            return Replies.yelledAt.rawValue
        default:
            return Replies.allElse.rawValue
        }
    }

    /// Enum to encapsulate the possible replies Bob can give.
    enum Replies: String {
        case question = "Sure."
        case yelledAt = "Whoa, chill out!"
        case yelledQuestion = "Calm down, I know what I'm doing!"
        case passiveAggress = "Fine. Be that way!"
        case allElse = "Whatever."
    }
}
