import Foundation

//Solution goes in Sources

struct NumberClassifier {
    
    var classification: theClassification

    enum theClassification {
        case perfect, abundant, deficient
    }
        
    init( number: Int) {
        var theSum = 1 // no need to test 1 in the loop, it's always a factor
        for i in 2...(number - 1) { // -1 because we exclude number itself from sum
            if number % i == 0 {
                theSum += i
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
