import Foundation

//Solution goes in Sources
struct Hamming {
    
    static func compute(_ input: String, against: String) -> Int? {
        
        // strings of different length shouldn't be tested
        guard (input.count == against.count) else {
            return nil
        }

        var differences: Int = 0
        
        for (index, value) in input.enumerated() {
            let againstIndex = against.index(against.startIndex, offsetBy: index)
            let againstValue = against[againstIndex]
            
            if (value != againstValue) {
                differences += 1
            }
        }
        
        return differences
    }
}
