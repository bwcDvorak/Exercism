import Foundation

struct Transpose {
    static func transpose(_ input: [String]) -> [String] {
        var output = [String](repeating: "", count: input.count)
        
        for i in 0..<input.count {
            var maxLength = input[i].count
            for j in (i+1)..<input.count {
                if input[j].count > maxLength {
                    maxLength = input[j].count
                }
            }
            output[i] = input[i].padding(toLength: maxLength, withPad: " ", startingAt: 0)
        }
        
        // 2D transform
        let maxRowLength = output.max(by: { $0.count < $1.count })?.count ?? 0
        var transformed: [String] = Array(repeating: "", count: maxRowLength)

        for i in 0..<maxRowLength {
            var tempString = ""
            for string in output {
                if i < string.count {
                    tempString.append(string[string.index(string.startIndex, offsetBy: i)])
                }
            }
            transformed[i] = tempString
        }

        return transformed
    }
}
