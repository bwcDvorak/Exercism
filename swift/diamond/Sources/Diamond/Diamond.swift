import Foundation

//Solution goes in Sources

struct Diamond {

    static func makeDiamond(letter: Character) -> [String] {
        let myAlphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        var myDiamond = [String]()

        guard let myIndex = myAlphabet.firstIndex(of: letter) else {
            return [""]
        }

        for i in 0...myIndex {
            var myLine = Array(repeating: " ", count: myIndex*2+1)
                myLine[myIndex-i] = String(myAlphabet[i])
                myLine[myIndex+i] = String(myAlphabet[i])
                myDiamond.append(String(describing: myLine.joined()))
            }
        
            myDiamond += myDiamond.dropLast().reversed()
            return myDiamond
    }
}
