import Foundation

//Solution goes in Sources

struct PrimeFactors {

    var toArray = [Int]()
    
    init(_ input: Int) {
        
        // smallest value we might append to toArray
        guard input >= 2 else { return }
        
        var remainder = input
        var divisor = 2

        while remainder > 1 {
            if remainder % divisor == 0 {
                toArray.append(divisor)
                remainder /= divisor
            } else {
                divisor += 1
            }
        }
    }
}
