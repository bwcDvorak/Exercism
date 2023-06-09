import Foundation

//Solution goes in Sources

struct Garden {
    
    static let classmates = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]
    
    enum plants {
        case clover, grass, radishes, violets
        case other
    }
    
    func decodePlant (_ char: Character) -> plants {
        switch char {
        case "C": return .clover
        case "G": return .grass
        case "R": return .radishes
        case "V": return .violets
        default: return .other
        }
    }
    
    let theGarden: [String]
    let theChildren: [String]
    
    init(_ theGarden: String, children: [String] = Self.classmates) {
        self.theGarden = theGarden.split(separator: "\n").map {String($0)}
        // need sorted() for the tests that hand you kids out of order
        self.theChildren = children.sorted()
    }
    
    func plantsForChild (_ name: String) -> [plants] {
        var returnPlants = [plants]()

        guard let position = theChildren.firstIndex(of: name) else {
            return []
        }
        
        // remember, theChildren is zero indexed
        let startPlant = position * 2 // two chars per kid
        let endPlant = startPlant + 1
                        
        // theGarden is an array of strings
        // need to get startPlant and endPlant chars, convert to plants, and append to return
        for row in theGarden {
            if let firstPlant = row.index(row.startIndex, offsetBy: startPlant, limitedBy: row.endIndex) {
                returnPlants.append(decodePlant(row[firstPlant]))
            }
            if let secondPlant = row.index(row.startIndex, offsetBy: endPlant, limitedBy: row.endIndex) {
                returnPlants.append(decodePlant(row[secondPlant]))
            }
        }
        
        return returnPlants
    }
}
