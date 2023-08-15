import Foundation

//Solution goes in Sources

struct NumberSeries {
    var digits = [Int]()

    
    init(_ input: String) throws {
        
        guard input != "" else {
            throw NumberSeriesError.spanLongerThanStringLength
        }
        
        guard input.rangeOfCharacter(from: CharacterSet.letters) == nil else {
            throw NumberSeriesError.invalidCharacter
        }
        
        digits = input.compactMap { Int(String($0)) }
    }
    
    enum NumberSeriesError: Error {
        case spanLongerThanStringLength
        case invalidCharacter
        case negativeSpan
    }
    
    func largestProduct(_ input: Int) throws -> Int {
        let span = input
        var maxProduct = 0
        
        guard input > 0 else {
            throw NumberSeriesError.negativeSpan
        }
        
        guard digits.count >= span else {
            throw NumberSeriesError.spanLongerThanStringLength
        }
        
        // loop through digits, using span to ensure we don't overrun end
        for i in 0...(digits.count - span) {
            // .reduce uses the 2nd arg to transform the values in the array to a single result
            let product = digits[i..<(i + span)].reduce(1, *)
            maxProduct = max(maxProduct, product)
        }
        
        return maxProduct
    }
    
}
