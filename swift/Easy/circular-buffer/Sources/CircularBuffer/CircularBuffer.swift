import Foundation

enum CircularBufferError: Error {
    case bufferEmpty
    case bufferFull
}

struct CircularBuffer {
    private var buffer: [Int]
    private let capacity: Int
    
    init(capacity: Int) {
        self.capacity = capacity
        self.buffer = [Int]()
    }
    
    mutating func read() throws -> Int {
        guard !buffer.isEmpty else {
            throw CircularBufferError.bufferEmpty
        }
        return buffer.removeFirst()
    }
    
    mutating func write(_ input: Int) throws {
        guard buffer.count < capacity else {
            throw CircularBufferError.bufferFull
        }
        buffer.append(input)
    }
    
    mutating func overwrite(_ input: Int) {
        if buffer.count < capacity {
            try? write(input)
        } else {
            buffer.removeFirst()
            buffer.append(input)
        }
    }
    
    mutating func clear() {
        buffer.removeAll() 
    }
}
