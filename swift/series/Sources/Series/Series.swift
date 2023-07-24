import Foundation

//Solution goes in Sources

struct Series {
    let inputString: String
        
        init(_ inputString: String) {
            self.inputString = inputString
        }
        
        func slices(_ n: Int) -> [[Int]] {
            var result: [[Int]] = []
            let count = inputString.count
            
            for i in 0..<(count - n + 1) {
                let startIndex = inputString.index(inputString.startIndex, offsetBy: i)
                let endIndex = inputString.index(startIndex, offsetBy: n)
                let substring = inputString[startIndex..<endIndex]
                let integers = substring.compactMap { Int(String($0)) }
                result.append(integers)
            }
            
            return result
        }
}
