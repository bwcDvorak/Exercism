import Foundation

enum ClassificationError: Error, Equatable {
    case invalidInput
}

struct NumberClassifier {
    
    var classification: Classification
    
    enum Classification: String {
        case perfect, abundant, deficient
    }
        
    init(number: Int) throws {
        guard number > 0 else {
            throw ClassificationError.invalidInput
        }
        
        // Special case: 1 has no positive divisors other than itself
        if number == 1 {
            self.classification = .deficient
            return
        }
        
        var theSum = 0 // Initialize the sum to 0
        
        let sqrtNumber = Int(sqrt(Double(number)))
        for i in 1...sqrtNumber { // Start the loop from 1
            if number % i == 0 {
                if i == number / i || i == 1 { // Include 1 and exclude the number itself
                    theSum += i
                } else {
                    theSum += i + (number / i)
                }
            }
        }
        
        if theSum > number {
            self.classification = .abundant
        } else if theSum < number {
            self.classification = .deficient
        } else {
            self.classification = .perfect
        }
    }
}


func classify(number: Int) throws -> NumberClassifier.Classification {
    // Initialize NumberClassifier with number; it will throw an error if number < 1
    let classifier = try NumberClassifier(number: number)
    return classifier.classification
}
