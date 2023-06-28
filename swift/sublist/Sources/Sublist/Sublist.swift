import Foundation

//Solution goes in Sources

enum Classification {
    case equal
    case sublist
    case superlist
    case unequal
}

func classifier( listOne: [Int], listTwo: [Int]) -> Classification {
    
    if listOne == listTwo {
        return .equal
    }
    
    if listOne.count < listTwo.count && isSublist(listOne, in: listTwo){
        return .sublist
    }
    
    if listOne.count > listTwo.count && isSublist(listTwo, in: listOne) {
        return .superlist
    }
    
    if !listOne.isEmpty && listTwo.isEmpty {
        return .superlist
    }
    
    if listOne.count > listTwo.count && isSublist(listOne, in: listTwo){
        return .superlist
    }
    
    return .unequal
}

func isSublist(_ sublist: [Int], in list: [Int]) -> Bool {
    if sublist.isEmpty {
        return true
    }
    
    guard sublist.count <= list.count else {
        return false // sublists can't be longer
    }

    for i in 0...(list.count - sublist.count) {
        
        let arraySlice = (i + sublist.count)
        let testSlice = Array(list[i..<arraySlice])
        
        if testSlice == sublist {
            return true
        }
    }
    
    return false
}
