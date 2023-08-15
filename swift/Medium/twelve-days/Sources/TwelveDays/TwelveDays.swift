import Foundation

//Solution goes in Sources

struct TwelveDaysSong {
    
    /// triple double quotes below mean "multi-line string literal"
    /// can contain line breaks and preserves formatting
    static let theSong =
            """
            On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.
            On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.
            On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
            On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
            On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
            On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
            On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
            On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
            On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
            On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
            On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
            On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
            """
    
    // turn into an array for loop convenience
    static let songArray = theSong.components(separatedBy: "\n")
    
    static func verse(_ theVerse: Int) -> String {
        guard theVerse >= 0 && theVerse <= songArray.count else {
            return "Sorry, something went wrong in verse()."
        }
        // darn you, zero-indexing
        return songArray[theVerse - 1]
    }
    
    static func verses(_ startVerse: Int,_ endVerse: Int) -> String {
        guard startVerse >= 1 && startVerse <= songArray.count else {
            return "Sorry, a bad starting verse number was passed in."
        }

        guard endVerse >= 1 && endVerse <= songArray.count else {
            return "Sorry, a bad ending verse number was passed in."
        }

        var returnString = ""

        for aVerse in startVerse...endVerse {
            returnString += songArray[aVerse - 1]
            if aVerse < endVerse { returnString += "\n"}
            // skip the newline on the final verse, in other words
        }
        
        return returnString
    }
    
    static func sing() -> String {
        return verses(1, 12)
    }
    
}
