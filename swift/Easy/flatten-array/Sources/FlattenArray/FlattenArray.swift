import Foundation
//Solution goes in Sources

func flattenArray<T>(_ lists: [Any?]) -> [T] {
    var returnList: [T] = []

    for item in lists {
        if item is [Any] {
            returnList.append(contentsOf: flattenArray(item as! [Any]))
        } else {
            if item != nil {
                returnList.append(item as! T)
            }
        }
    }
    return returnList
}
