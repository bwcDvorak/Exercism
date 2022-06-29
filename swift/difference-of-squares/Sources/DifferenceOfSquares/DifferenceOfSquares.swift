import Foundation

//Solution goes in Sources
struct Squares {
    let input: Int
    
    init (_ input:Int) {
        self.input = input
    }
    
    var squareOfSum:Int {
        let sum = ((input * (input + 1)) / 2)
        return (sum * sum)
    }
    
    var sumOfSquares:Int {
        guard input > 0 else {
            return 0
        }
        
       return  ((input * (input + 1) * ((2 * input) + 1 )) / 6)
    }
    
    var differenceOfSquares: Int {
        squareOfSum - sumOfSquares
    }
    
}
