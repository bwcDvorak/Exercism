import Foundation

//Solution goes in Sources


enum BaseError: Error {
    case negativeDigit
    case invalidPositiveDigit
    case invalidInputBase
    case invalidOutputBase
}

struct Base {
    static func outputDigits ( inputBase: Int, inputDigits: [Int], outputBase: Int) throws -> [Int] {
        var inputArray = inputDigits
        var outputArray = [Int]()
        
        // check inputDigits for bad values
        if inputBase <= 1 { throw BaseError.invalidInputBase}
        if outputBase <= 1 { throw BaseError.invalidOutputBase}
        
        // drop leading zeroes from inputArray
        while (inputArray.first == 0 && !inputArray.isEmpty) {
            inputArray.removeFirst()
        }
        
        if !inputArray.isEmpty {
            var baseTen = 0
            // length of inputArray at this point = the power we initially raise inputBase to
            let inputPower = inputArray.count
            
            for i in 0...(inputPower - 1) {
                let digit = inputArray[i]
                // continue checking for bad inputs
                if digit < 0 { throw BaseError.negativeDigit }
                if digit >= inputBase { throw BaseError.invalidPositiveDigit}
                
                // if input good, convert remaining digits to base 10
                
                // pow requires doubles
                let theInputBase = Double(inputBase)
                // inputArray is zero-indexed, but exponents are one-indexed
                let theInputExponent = Double(inputPower - (i + 1))
                
                // convert pow back to int
                baseTen += digit * Int(pow(theInputBase, theInputExponent))
            }
            
            // convert baseTen to outputBase
            while baseTen > 0 {
                let newDigit = baseTen % outputBase
                outputArray.insert(newDigit, at:0)
                
                baseTen /= outputBase
            }
        }
        
        return outputArray
    }
}
