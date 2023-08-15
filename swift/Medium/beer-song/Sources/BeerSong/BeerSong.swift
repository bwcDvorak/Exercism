import Foundation
//Solution goes in Sources
struct BeerSong {
    var numberOfBottles: Int
    
    init (numberOfBeerBottles: Int) {
        self.numberOfBottles = numberOfBeerBottles
    }
    
    func generateVersesOfBeerSong () -> String {
        var returnString = ""
        var currentBottles = self.numberOfBottles
        while currentBottles > 2 {
            returnString += String(currentBottles) + " bottles of beer on the wall, " + String(currentBottles) + " bottles of beer.\nTake one down and pass it around, " + String((currentBottles - 1)) + " bottles of beer on the wall.\n\n"
            currentBottles -= 1
        }
        
        // start plural, end singular
        if currentBottles == 2 {
            returnString += String(currentBottles) + " bottles of beer on the wall, " + String(currentBottles) + " bottles of beer.\nTake one down and pass it around, " + String((currentBottles - 1)) + " bottle of beer on the wall.\n\n"
            currentBottles -= 1
        }
        
        if currentBottles == 1 {
            returnString.append("1 bottle of beer on the wall, 1 bottle of beer.\nTake one down and pass it around, no more bottles of beer on the wall.\n\n")
        }
        // we know we're down to zero bottles now, no conditional
        returnString.append("No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.")
        
        return returnString
    }
}
