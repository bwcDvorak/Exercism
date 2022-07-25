import Foundation

enum CircularBufferError: Error {
    case bufferEmpty
    case bufferFull
}


//Solution goes in Sources
struct CircularBuffer<T> {
    var myList    : [T]
    var myCapacity: Int
    

    init(capacity: Int) {
        self.myCapacity   = capacity
        myList       = [T]()
    }
    

    mutating func read() throws -> T? {
        if myList.count == 0 {
            throw CircularBufferError.bufferEmpty
        }
        return myList.removeFirst()
    }

    
    mutating func write(_ input: T) throws {
        if (myList.count >= myCapacity) {
            throw CircularBufferError.bufferFull
        }
        myList.append(input)
    }

    
    mutating func overwrite(_ input: T) {
        if (myList.count < myCapacity) {
            try? write(input)
        } else {
            myList.removeFirst()
            myList.append(input)
        }
    }

    
    mutating func clear() {
        myList.removeAll(keepingCapacity: true)
    }
}
