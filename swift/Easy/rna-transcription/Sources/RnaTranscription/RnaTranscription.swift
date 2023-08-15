import Foundation

// Define the 'Nucleotide' enum, its `init`, and its `complementOfDNA` method

enum TranscriptionError: LocalizedError {
    case invalidNucleotide(_ n: String)
}

struct Nucleotide {
    var dnaString = ""
    let myNucleotides = "GCTA"
    
    init (_ from:String) {
        dnaString = from
    }
        
    func complementOfDNA() throws -> String {
        var returnString = ""
        
        try dnaString.forEach { n in
            switch n {
            case "G":
                returnString += "C"
            case "C":
                returnString += "G"
            case "T":
                returnString += "A"
            case "A":
                returnString += "U"
            default:
                throw TranscriptionError.invalidNucleotide("\(n) is not a valid Nucleotide")
            }
        }
        return returnString
    }
}
