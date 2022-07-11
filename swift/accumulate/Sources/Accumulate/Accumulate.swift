import Foundation

//Solution goes in Sources
extension Array {
    func accumulate<T>(_ function: (Element) -> T) -> [T] {
        var result = [T]()
        for i in self {
            result.append(function(i))
        }
        return result
    }
}
