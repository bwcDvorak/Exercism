import Foundation

// Solution goes in Sources

class Deque<T> {
    private var elements: [T] = []

    // Pushes a value onto the back of the linked list.
    func push(_ value: T) {
        elements.append(value)
    }

    // Pops and returns the value from the back of the linked list,
    // or nil if it is empty.
    func pop() -> T? {
        return elements.popLast()
    }

    // Adds a value to the front of the linked list.
    func unshift(_ value: T) {
        elements.insert(value, at: 0)
    }

    // Removes and returns the value from the front of the linked list,
    // or nil if the linked list is empty.
    func shift() -> T? {
        if elements.isEmpty {
            return nil
        }
        return elements.removeFirst()
    }
}
