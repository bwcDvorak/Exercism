import Foundation

// Custom error types to describe possible failures
enum WordyError: Error {
    case irrelevant  // question is not a math problem.
    case tooAdvanced // math operation is not supported.
}

struct WordProblem {
    let question: String
    
    
    init(_ question: String) {
        self.question = question
    }
    
    func answer() throws -> Int {
        // Split question into word tokens.
        var tokens = question.split(separator: " ")
        
        // Validate structure of question.
        guard tokens.count >= 3, tokens.first == "What", tokens[1] == "is" else {
            throw WordyError.irrelevant
        }
        
        // Remove "What is" part.
        tokens.removeFirst(2)
        
        // Remove '?' from last token if still present.
        if let last = tokens.last, last.last == "?" {
            var newLast = last
            newLast.removeLast()
            tokens[tokens.count - 1] = newLast
        }
        
        // Extract and remove first operand.
        guard var result = Int(tokens.removeFirst()) else {
            throw WordyError.irrelevant
        }
        
        // Loop through remaining tokens to perform calculations.
        while !tokens.isEmpty {
            // Extract and remove operation (plus, minus, etc.)
            guard let operation = tokens.first else {
                throw WordyError.irrelevant
            }
            tokens.removeFirst()
            
            // Perform corresponding arithmetic operation.
            switch operation {
            case "plus":
                // Make sure there is another operand, then add.
                guard tokens.count > 0, let operand = Int(tokens.removeFirst()) else {
                    throw WordyError.irrelevant
                }
                result += operand
                
            case "minus":
                guard tokens.count > 0, let operand = Int(tokens.removeFirst()) else {
                    throw WordyError.irrelevant
                }
                result -= operand
                
            case "multiplied":
                // Make sure next token is "by" and another operand exists, then multiply.
                guard tokens.first == "by", let operand = Int(tokens[1]) else {
                    throw WordyError.irrelevant
                }
                tokens.removeFirst(2)
                result *= operand
                
            case "divided":
                // Make sure next token is "by" and another operand exists, then divide.
                guard tokens.first == "by", let operand = Int(tokens[1]) else {
                    throw WordyError.irrelevant
                }
                tokens.removeFirst(2)
                result /= operand
                
            default:
                // If operation is not supported, throw an error.
                throw WordyError.tooAdvanced
            }
        }
        
        return result
    }
}
