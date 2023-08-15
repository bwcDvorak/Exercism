//Solution goes in Sources


extension Array {
    func keep (_ predicate: (Element) -> Bool) -> [Element] {
        var returnArray = [Element]()
        
        for elem in self where predicate(elem) {
            returnArray.append(elem)
        }
        
        return returnArray
    }
    
    func discard (_ predicate: (Element) -> Bool) -> [Element] {
        var returnArray = [Element]()
        
        for elem in self where !predicate(elem) {
            returnArray.append(elem)
        }
        
        return returnArray
    }
}
