import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

//Solution goes in Sources

struct IsbnVerifier {
    static var returnValue: Bool = false

    static func isValid (_ input: String) -> Bool {
        returnValue = false
        var shortString = input.filter {$0 != "-"}
        
        let xIndex      = shortString.firstIndex(of: "X") ?? shortString.endIndex
        let endIndex    = shortString.endIndex
        
        // a properly placed X should have a distance of exatly one
        let misplacedX  = shortString.distance(from: xIndex, to: endIndex) > 1
        let hasNoX      = shortString.firstIndex(of: "X") == nil
        
        // contains 10 (and only 10) characters...
        // and firstIndex of "X" is either nil or equal to lastIndex
        if (shortString.count == 10) && (!misplacedX || hasNoX) {
            var checkSum    = 0
            var multiplier  = 10
            
            // first nine digits
            while (multiplier > 1) {
                checkSum += (shortString.removeFirst().wholeNumberValue ?? 0) * multiplier
                multiplier -= 1
            }
            
            // last digit
            if shortString[0] == "X" {
                checkSum += 10
            } else { checkSum += shortString[0].wholeNumberValue ?? 0}
            
            if (checkSum % 11 == 0) {
                returnValue = true
            }
        }
        return returnValue
    }
}
