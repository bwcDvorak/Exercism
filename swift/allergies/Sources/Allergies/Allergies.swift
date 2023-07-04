import Foundation

//Solution goes in Sources

struct Allergies {

    enum allergyTypes: UInt, CaseIterable {
        case eggs           = 1
        case peanuts        = 2
        case shellfish      = 4
        case strawberries   = 8
        case tomatoes       = 16
        case chocolate      = 32
        case pollen         = 64
        case cats           = 128
    }
    
    var allergyScore: UInt
    init(_ score: UInt) {
        self.allergyScore = score
    }
    
    func hasAllergy(_ inputType: allergyTypes) -> Bool {
        // if bitwise and returns positive value, we have the allergy
        return (allergyScore & inputType.rawValue) > 0
    }
    
    // lesson says we should provide a list of all the allergies
    // but no tests exist. I think this works, though.
    
    func allAllergies() -> [allergyTypes] {
        var returnArray = [allergyTypes]()

        for anAllergy in allergyTypes.allCases {
            if ((allergyScore & anAllergy.rawValue) > 0) {
                returnArray.append(anAllergy)
            }
        }
        
        return returnArray
    }
}
