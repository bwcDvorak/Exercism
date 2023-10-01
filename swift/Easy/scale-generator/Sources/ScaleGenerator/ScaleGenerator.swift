struct ScaleGenerator {
    
    private enum Step: Character {
        case minor = "m"
        case major = "M"
        case augmented = "A"
    }

    static let sharps = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"]
    static let flats = ["A", "Bb", "B", "C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab"]
    
    var tonic: String
    var scale: [String]
    
    init(tonic: String) {
        self.scale = ScaleGenerator.getScale(from: tonic)
        self.tonic = tonic.capitalize()
    }
    
    func chromatic() -> [String] {
        scale
    }
        
    func interval(_ pattern: String) -> [String] {
        guard var index = scale.firstIndex(of: tonic) else { return [] }
        return pattern.compactMap { Step(rawValue: $0) }.map { step in
            let note = scale[index]
            switch step {
            case .minor:
                index = (index + 1) % scale.count
            case .major:
                index = (index + 2) % scale.count
            case .augmented:
                index = (index + 3) % scale.count
            }
            return note
        } + [tonic]
    }
    
    private static func getScale(from tonic: String) -> [String] {
        let selectedScale = (["G", "D", "A", "E", "B", "F#", "C", "e", "b", "f#", "c#", "g#", "d#", "a"].contains(tonic)) ? sharps : flats
        guard let index = selectedScale.firstIndex(of: tonic) else { return selectedScale }
         let prefixArray = Array(selectedScale.prefix(upTo: index))
         let suffixArray = Array(selectedScale.suffix(from: index))
         return suffixArray + prefixArray
    }
}

extension String {
    func capitalize() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
}
