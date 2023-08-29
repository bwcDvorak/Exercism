import Foundation

//Solution goes in Sources

struct Allergies {

    // Enum defining allergy types & scores
    enum allergyTypes: UInt, CaseIterable {
        case eggs           = 1
        case peanuts        = 2
        case shellfish      = 4
        case strawberries   = 8
        case tomatoes       = 16
        case chocolate      = 32
        case pollen         = 64
        case cats           = 128
        
        // String representation of the allergy
        var description: String {
            switch self {
            case .eggs: return "eggs"
            case .peanuts: return "peanuts"
            case .shellfish: return "shellfish"
            case .strawberries: return "strawberries"
            case .tomatoes: return "tomatoes"
            case .chocolate: return "chocolate"
            case .pollen: return "pollen"
            case .cats: return "cats"
            }
        }

        // Convert a string into corresponding enum value
        static func from(string: String) -> allergyTypes? {
            for type in allergyTypes.allCases {
                if type.description == string {
                    return type
                }
            }
            return nil
        }
    }
    
    // Total score representing the user's allergies
    var allergyScore: UInt
    
    // Initialize struct for a given score
    init(_ score: UInt) {
        self.allergyScore = score
    }
    
    // Check for the provided allergy type
    func allergicTo(_ inputType: allergyTypes) -> Bool {
        return (allergyScore & inputType.rawValue) > 0
    }
    
    // Overloaded method to check allergy based on a string
    func allergicTo(item: String) -> Bool {
        guard let type = allergyTypes.from(string: item) else {
            return false
        }
        return allergicTo(type)
    }

    // List all allergies the user has based on their score
    func list() -> [String] {
        return allergyTypes.allCases.filter { allergicTo($0) }
                                     .sorted { $0.rawValue < $1.rawValue }
                                     .map { $0.description }
    }
    
}
