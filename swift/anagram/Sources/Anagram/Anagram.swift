import Foundation

//Solution goes in Sources

struct Anagram {
    
    var word: String
    var wordSorted: String
    
    init(word: String) {
        self.word       = word.lowercased()
        self.wordSorted = String(word.lowercased().sorted())
    }
    
    func match(_ input: [String]) -> [String] {
        var returnArray = [String]()
        
        for i in 0...(input.count - 1) {
            if word != input[i].lowercased() {
                let testWord = String(input[i].lowercased().sorted())
                if testWord == wordSorted {
                    returnArray.append(input[i])
                }
            }
        }
        
        return returnArray
    }
}
