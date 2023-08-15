class RunLengthEncoding {
    static func encode(_ phrase: String) -> String {
        var result = ""
        var count = 1
        
        var index = phrase.startIndex
        
        while index < phrase.endIndex {
            let currentChar = phrase[index]
            let nextIndex = phrase.index(after: index)
            
            if nextIndex < phrase.endIndex {
                let nextChar = phrase[nextIndex]
                
                if currentChar == nextChar {
                    count += 1
                } else {
                    if count > 1 {
                        result.append("\(count)")
                    }
                    result.append(currentChar)
                    count = 1
                }
                
                index = nextIndex
            } else {
                if count > 1 {
                    result.append("\(count)")
                }
                result.append(currentChar)
                index = phrase.endIndex
            }
        }
        
        return result
    }
    static func decode(_ phrase: String) -> String {
        var result = ""
        var countString = ""
        
        for char in phrase {
            if char.isNumber {
                countString.append(char)
            } else {
                if let count = Int(countString) {
                    result += String(repeating: char, count: count)
                    countString = ""
                } else {
                    result.append(char)
                }
            }
        }
        
        return result
    }
}
