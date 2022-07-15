import Foundation

//Solution goes in Sources

struct DNA {
    let myNucleotides = "ATCG"

    var dnaStrand: String
    
    init? (strand: String) {
        // reject strings with lowercase letters
        guard (strand.uppercased() == strand) else {
            return nil
        }
   
        dnaStrand = strand
    }
    
    func counts() -> [String: Int] {
        var results: [String: Int] = [ "A": 0, "T": 0, "C": 0, "G": 0 ]
        
        dnaStrand.forEach { n in
            switch n {
            case "A":
                results["A"]! += 1
            case "T":
                results["T"]! += 1
            case "C":
                results["C"]! += 1
            case "G":
                results["G"]! += 1
            default:
                    return
            }
        }
         return results
    }

    func count(_ input: String) -> Int {
        var results: Int = 0
        
        dnaStrand.forEach {
            if $0 == Character(input) {
                results += 1
            }
        }
         return results
    }
}
