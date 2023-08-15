import Foundation

//Solution goes in Sources

struct House {
    
    static var lines: [(noun: String, verb: String)] =
    [("house that Jack built.", ""),
     ("malt", "lay in"),
     ("rat", "ate"),
     ("cat", "killed"),
     ("dog", "worried"),
     ("cow with the crumpled horn", "tossed"),
     ("maiden all forlorn", "milked"),
     ("man all tattered and torn", "kissed"),
     ("priest all shaven and shorn", "married"),
     ("rooster that crowed in the morn", "woke"),
     ("farmer sowing his corn", "kept"),
     ("horse and the hound and the horn", "belonged to")]
    
    
    // call into makeVerse() for easier debugging
    static func recite() -> String {
        var output = [String]()
        
        // special case first verse for better readability
        output.append("This is the \(lines[0].noun)")

        // now we can just loop through the remaining verses
        for i in 1...11 {
            var theVerse = "This is the \(lines[i].noun)"
            for j in stride(from: i, through: 1, by: -1) {
                theVerse +=  "\nthat " + lines[j].verb + " the " + lines[j - 1].noun
            }
            output.append(theVerse)
        }
        return output.joined(separator: "\n\n")
    }
}
