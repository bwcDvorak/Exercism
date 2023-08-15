import Foundation

enum BinarySearchError: Error {
    case unsorted
}

//Solution goes in Sources
struct BinarySearch {
    
    var list: [Int]
    var middle: Int
    
    init(_ input: [Int]) throws {
        if (input == input.sorted {$0 < $1}) {
            list = input
        } else {
            throw BinarySearchError.unsorted
        }
        
        // middle: lengh divided by two (Ints round down by default)
        middle = (input.count / 2)
    }
    
    // if item is found, returns position in list
    func searchFor(_ input: Int) -> Int? {
        var listStart       = 0
        var listEnd         = (list.endIndex - 1)
        var searchPosition  = middle
        
        while !((searchPosition == listStart) || (searchPosition == listEnd)) {
            if (input == list[searchPosition]) {
                return searchPosition
            } else if (input > list[searchPosition]) {
                listStart = searchPosition
            } else if (input < list[searchPosition]) {
                listEnd = searchPosition
            }
            searchPosition = (listStart + listEnd) / 2
        }
        // fall through if key not found
        return nil
    }
}
