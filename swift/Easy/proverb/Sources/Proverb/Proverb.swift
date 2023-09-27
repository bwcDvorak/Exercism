import Foundation

struct Proverb {
    let words: [String]
    
    init(_ words: [String]) {
        self.words = words
    }
    
    func recite() -> String {
        guard !words.isEmpty else { return "" }
        
        var returnText = ""
        let firstElement = words.first!
        let wordsCount = words.count
        
        for i in 0..<wordsCount {
            if i < (wordsCount - 1) {
                let theElement = words[i]
                let nextElement = words[i + 1]
                returnText += "For want of a \(theElement) the \(nextElement) was lost.\n"
            } else {
                returnText += "And all for the want of a \(firstElement)."
            }
        }
        
        return returnText
    }
}
