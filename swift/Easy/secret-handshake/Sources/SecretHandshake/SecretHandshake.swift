import Foundation

//Solution goes in Sources

struct SecretHandshake {
    
    var theInt: Int
    
    init(_ input: Int) {
        theInt = input
    }
    
    var commands: [String] {
        var returnString = [String]()
        
        // '&' does bitwise AND - returns the int where bits that match are 1s
        // and bits that do not match are 0s. So '11 & 3' returns '3'.
        // 11 : 00001011
        //  3 : 00000011
        // -------------
        //  3 : 00000011
        
        if theInt & 1 != 0 {returnString.append("wink")}
        if theInt & 2 != 0 {returnString.append("double blink")}
        if theInt & 4 != 0 {returnString.append("close your eyes")}
        if theInt & 8 != 0 {returnString.append("jump")}
        if theInt & 16 != 0 {returnString.reverse()}

        return returnString
    }
}
