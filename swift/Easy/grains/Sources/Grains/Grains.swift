import Foundation

//Solution goes in Sources

struct Grains {
    
    enum GrainsError: LocalizedError {
        case inputTooLow(_ message: String)
        case inputTooHigh(_ message: String)
    }
    
    // I suspect I'm not supposed to solve this this way, but...
    static var total: UInt64 {
        // bitwise shift (<<) 2; do it 64 times. then subtract 1 allowing overflow (&-)
        return 2 << 64 &- 1
    }
    
    
    static func square(_ input: Int) throws -> UInt64 {
        
        if (input >= 1) {
            //stuff happens
        } else {
            throw GrainsError.inputTooLow("Input[\(input)] invalid. Input should be between 1 and 64 (inclusive)")
        }
        
        if (input <= 64) {
            
        } else {
            throw GrainsError.inputTooHigh("Input[\(input)] invalid. Input should be between 1 and 64 (inclusive)")
        }
        
        // << is bitwise shift
        return 1 << (input - 1)
    }
}
