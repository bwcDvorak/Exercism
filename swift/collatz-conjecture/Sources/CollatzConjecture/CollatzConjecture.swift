import Foundation

//Solution goes in Sources
struct CollatzConjecture {

    enum InputError: Error {
        case InvalidRange
    }

    
    static func steps(_ input: Int) throws -> Int {
        var myInput = input
        var mySteps = 0
        
        if myInput <= 0 {
            throw InputError.InvalidRange
        }
        
        while (myInput != 1) {
            mySteps += 1
            if ((myInput % 2) == 0) {
                myInput /= 2
            } else {
                myInput = ((myInput * 3) + 1)
            }
        }
        return mySteps
    }
}
