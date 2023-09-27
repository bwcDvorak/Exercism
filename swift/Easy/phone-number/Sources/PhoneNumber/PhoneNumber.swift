import Foundation

enum PhoneNumberError: Error, Equatable {
    case invalidPhoneNumber
    case regexCreationFailed
}

struct PhoneNumber: CustomStringConvertible {
    var number: String
    var areaCode: String
    var exchangeCode: String
    var subscriberNumber: String
    
    var description: String {
        "(\(areaCode)) \(exchangeCode)-\(subscriberNumber)"
    }
    
    init(_ inputString: String) throws {
        let cleanedNumber = try PhoneNumber.clean(inputString)
        
        guard cleanedNumber.count == 10,
              let firstChar = cleanedNumber.first,
              firstChar != "0",
              firstChar != "1"
        else {
            throw PhoneNumberError.invalidPhoneNumber
        }
        
        let areaIndex = cleanedNumber.index(cleanedNumber.startIndex, offsetBy: 3)
        let exchangeIndex = cleanedNumber.index(areaIndex, offsetBy: 3)
        
        areaCode = String(cleanedNumber[..<areaIndex])
        
        let exchangeCodeFirstChar = cleanedNumber[areaIndex]
        
        guard exchangeCodeFirstChar != "0", exchangeCodeFirstChar != "1" else {
            throw PhoneNumberError.invalidPhoneNumber
        }
        
        exchangeCode = String(cleanedNumber[areaIndex..<exchangeIndex])
        subscriberNumber = String(cleanedNumber[exchangeIndex...])
        number = cleanedNumber
    }
    
    func clean() throws -> String {
        try PhoneNumber.clean(self.number)
    }
    
    private static func clean(_ inputString: String) throws -> String {
        var tempString = ""
        
        do {
            let pattern = "\\d"
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            
            let matches = regex.matches(in: inputString, options: [], range: NSRange(inputString.startIndex..., in: inputString))
            
            for match in matches {
                let range = Range(match.range, in: inputString)!
                tempString += String(inputString[range])
            }
        } catch {
            throw PhoneNumberError.regexCreationFailed
        }
        
        guard tempString.count >= 10 else {
            throw PhoneNumberError.invalidPhoneNumber
        }
        
        if tempString.count > 10 {
            tempString = String(tempString.drop(while: { $0 == "1" }))
        }
        
        let areaIndex = tempString.index(tempString.startIndex, offsetBy: 3)
        
        guard ["0", "1"].contains(tempString.first) == false,
              ["0", "1"].contains(tempString[areaIndex]) == false
        else {
            throw PhoneNumberError.invalidPhoneNumber
        }
        
        return tempString
    }
}
