import Foundation

//Solution goes in Sources

enum translationError: Error {
    case badCodon
}

struct ProteinTranslation {
        
    static func translationOfCodon (_ theCodon: String) throws -> String {
        
        switch theCodon {
        case "AUG":
            return "Methionine"
        case "UUU", "UUC":
            return "Phenylalanine"
        case "UUA", "UUG":
            return "Leucine"
        case "UCU", "UCC", "UCA", "UCG":
            return "Serine"
        case "UAU", "UAC":
            return "Tyrosine"
        case "UGU", "UGC":
            return "Cysteine"
        case "UGG":
            return "Tryptophan"
        case "UAA", "UAG", "UGA":
            return "STOP"
        default: throw translationError.badCodon
        }
    }
    
    static func translationOfRNA (_ inputCodons: String) throws -> [String] {
        var codons = inputCodons
        var returnArray = [String]()
        
        while codons.count >= 3 {
            let thisCodon = try translationOfCodon(String(codons.prefix(3)))
            if thisCodon != "STOP" {
                returnArray.append(thisCodon)
                codons.removeFirst(3)
            } else {
                return returnArray
            }
        }
        return returnArray
    }
}
