import Foundation

//Solution goes in Sources
struct ETL {
    static func transform (_ input: [Int: [String]]) -> [String: Int] {
        var output = [String: Int]()
        
        for (value, letters) in input {
            for letter in letters {
                output[letter.lowercased()] = value
            }
        }
        return output
    }
}
