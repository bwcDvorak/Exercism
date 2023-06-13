import Foundation

//Solution goes in Sources

struct PhoneNumber: CustomStringConvertible {
    var number              = ""
    var areaCode            = ""
    var exchangeCode        = ""
    var subscriberNumber    = ""
    var description         = ""
    
    init(_ inputString: String) {
        var tempString = ""
        
        let pattern = "\\d"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        
        let matches = regex.matches(in: inputString, options: [], range: NSRange(location: 0, length: inputString.utf16.count))
        
        for match in matches {
            if let range = Range(match.range, in: inputString) {
                tempString += String(inputString[range])
            }
        }
        
        // if string too long trim starting one(s)
        if tempString.count > 10 {
            let characterToTrim: Character = "1"
            tempString = String(tempString.drop(while: { $0 == characterToTrim }))
        }
        
        // if not exactly 10 chars now, bail with known bad value
        if tempString.count != 10 {
                number = "0000000000" // which is gonna fail every other test too
            return
        }
        
        areaCode = String(tempString.prefix(3))
        tempString = String(tempString.dropFirst(3))
        
        exchangeCode = String(tempString.prefix(3))
        tempString = String(tempString.dropFirst(3))

        subscriberNumber = String(tempString.prefix(4))
        number = areaCode + exchangeCode + subscriberNumber
        description = "(" + areaCode + ") " + exchangeCode + "-" + subscriberNumber
    }
}
