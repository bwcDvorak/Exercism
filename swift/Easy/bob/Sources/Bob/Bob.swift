import Foundation

//Solution goes in Sources
struct Bob {

    
    static func hey (_ input: String) -> String {
        // remove whitespace...
        var myTrimmedString     = input.trimmingCharacters(in: .whitespacesAndNewlines)
        // ...and diacritics like ¨
        myTrimmedString  = myTrimmedString.folding(options: .diacriticInsensitive, locale: .current)
        
        
        let isQuestion      = (myTrimmedString.last == "?")
        let containsLetters = (myTrimmedString.range(of: "([A-Za-z])", options: .regularExpression) != nil)

        // contains no lower case letters, therefore is yelled
        // based on the approach at https://sarunw.com/posts/different-ways-to-check-if-string-contains-another-string-in-swift/#check-if-a-string-contains-another-string
        let isYelled        = (myTrimmedString.range(of: "([a-z])", options: .regularExpression) == nil)
        
        enum Replies: String {
            case question       = "Sure."
            case yelledAt       = "Whoa, chill out!"
            case yelledQuestion = "Calm down, I know what I'm doing!"
            case passiveAggress = "Fine. Be that way!"
            case allElse        = "Whatever."
        }
        
        switch input {
        case _ where (myTrimmedString.isEmpty):
            return Replies.passiveAggress.rawValue
//      "containsLetters" below to deal with the "4?" test case
        case _ where (isQuestion && isYelled && containsLetters):
//            return Replies.yelledQuestion.rawValue
//      filed a bug with exercism on this. Lesson description
//      (and this lesson in other langugage tracks) says response
//      here should be yelledQuestion. Nonetheless, swift lesson test
//      expects yelledAt, so...
            return Replies.yelledAt.rawValue
        case _ where (isQuestion):
            return Replies.question.rawValue
        case _ where (isYelled && containsLetters):
            return Replies.yelledAt.rawValue
        default:
                return "Whatever."
        }
    }
}
