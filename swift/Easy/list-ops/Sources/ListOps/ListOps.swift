import Foundation

//Solution goes in Sources
struct ListOps<T> {
    
    static func append (_ lists: Array<T>...) -> Array<T> {
        var returnList = Array<T>()
        for list in lists {
            returnList += list
        }
        return returnList
    }
    
    
    static func concat (_ lists: Array<T>...) -> Array<T> {
        var returnList = Array<T>()
        lists.forEach {returnList += $0}
        return returnList
    }
    
    
    static func filter (_ list: Array<T>, closure: (T)-> Bool) -> Array<T> {
        var returnList = Array<T>()
        list.forEach {
            returnList = closure($0) ? returnList + [$0] : returnList
        }
        return returnList
    }
    
    static func length (_ list: Array<T>) -> Int {
        var returnLength = 0
        for _ in list {
            returnLength += 1
        }
        return returnLength
    }
    
    static func map (_ list: Array<T>, closure: (T) -> T) -> Array<T> {
        var returnList = Array<T>()
        list.forEach {
            returnList += [closure($0)]
        }
        return returnList
    }
    
    static func foldLeft (_ list: Array<T>, accumulated: T, combine operation: (T, T) -> T) -> T {
        var returnVal = accumulated
        list.forEach {
            returnVal = operation(returnVal, $0)
        }
        return returnVal
    }
    
    static func foldRight (_ list: Array<T>, accumulated: T, combine operation: (T, T) -> T) -> T {
        guard !list.isEmpty else{
            return accumulated
        }

        var returnVal       = accumulated
        let rightwardList   = Array<T>(list.reversed())
        rightwardList.forEach {
            returnVal = operation($0, returnVal)
        }
        return returnVal
    }
    
    static func reverse (_ list: Array<T>) -> Array<T> {
        guard !list.isEmpty else{
            return list
        }
        
        var returnList = Array<T>()
        for i in 1...list.count {
            returnList.append(list[list.count - i])
        }
        return returnList
    }
}
