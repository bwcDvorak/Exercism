import Foundation

// Solution goes in Sources

struct CustomSet<T: Hashable & Comparable>: Equatable {
    private var elements: Set<T> = []

    // Initializes an empty set
    init() { }

    // Initializes the set with an array of elements
    init(_ elements: [T]) {
        self.elements = Set(elements)
    }

    // Puts an element into the set
    mutating func put(_ element: T) {
        elements.insert(element)
    }

    // Deletes an element from the set
    mutating func delete(_ element: T) {
        elements.remove(element)
    }

    // Removes all elements from the set
    mutating func removeAll() {
        elements.removeAll()
    }

    // Checks if the set contains a specific element
    func containsMember(_ element: T) -> Bool {
        return elements.contains(element)
    }

    // Returns the number of elements in the set
    var count: Int {
        return elements.count
    }

    // Returns an alias for the count property, providing the same results
    var size: Int {
        return elements.count
    }

    // Returns an array of all elements in the set
    var allElements: [T] {
        return Array(elements)
    }

    // Computes the difference between two sets
    func difference(_ otherSet: CustomSet<T>) -> CustomSet<T> {
        let differenceElements = elements.subtracting(otherSet.elements)
        return CustomSet(Array(differenceElements))
    }

    // Checks if the set is disjoint with another set
    func isDisjoint(_ otherSet: CustomSet<T>) -> Bool {
        return elements.isDisjoint(with: otherSet.elements)
    }
    
    // Computes the intersection of two sets
    func intersection(_ otherSet: CustomSet<T>) -> CustomSet<T> {
        let intersectionElements = elements.intersection(otherSet.elements)
        return CustomSet(Array(intersectionElements))
    }
    
    // Checks if the set is a superset of another set
    func isSupersetOf(_ otherSet: CustomSet<T>) -> Bool {
        return elements.isSuperset(of: otherSet.elements)
    }

    // Computed property to return a sorted array of unique elements in the set
    var toSortedArray: [T] {
        return elements.sorted()
    }
    
    // Computed property to get the union of two sets
    var union: (CustomSet<T>) -> CustomSet<T> {
        return { otherSet in
            let unionElements = self.elements.union(otherSet.elements)
            return CustomSet(Array(unionElements))
        }
    }

    // Conformance to Equatable
    static func == (lhs: CustomSet<T>, rhs: CustomSet<T>) -> Bool {
        return lhs.elements == rhs.elements
    }
}
