import Foundation

//Solution goes in Sources

class Element<T> {
    var value: T?
    var next: Element?
    private let start: Element?
    
    init(_ value: T? = nil, _ next: Element? = nil) {
        self.value = value
        self.next = next
        self.start = next
    }
    
    // Convert elements to an array
    func toArray() -> [T] {
        var array: [T] = []
        var current: Element? = self
        while let node = current {
            if let val = node.value {
                array.append(val)
            }
            current = node.next
        }
        return array
    }
    
    // Reverse elements in the list
    func reverseElements() -> Element {
        var previous: Element?
        var current: Element? = self
        var next: Element?
        while current != nil {
            next = current?.next
            current?.next = previous
            previous = current
            current = next
        }
        return previous!
    }
    
    // Create elements from an array
    static func fromArray(_ array: [T]) -> Element {
        guard !array.isEmpty else { return Element() }
        guard array.count > 1 else { return Element(array[0], nil) }
        return (1..<array.count).reduce(Element(array[0], nil)) {
            Element(array[$1], $0)
        }.reverseElements()
    }
}
