import Foundation

//Solution goes in Sources
struct SumOfMultiples  {
    init() {
    }
    
    static func toLimit(_ inputLimit: Int, inMultiples: [Int]) -> Int {
        let theLimit            = inputLimit
        var theSum              = 0
        var sumArray: [Int]     = []
        
        // walk through the array of multiples
        for i in 0...(inMultiples.count - 1) {
            let myMultiple      = inMultiples[i]
            
            // catch bad inputs like multiplication by zero, or multiples greater than limit
            if (myMultiple > 0) && (inputLimit > 0) && ((theLimit % myMultiple) >= 0) && (theLimit > myMultiple) {
                // find the number of inner loops
                let loopCount = theLimit / myMultiple
                
                // find the products to add to sumArray
                for j in 1...loopCount {
                    let theProduct = (myMultiple * j)
                    // avoid double-summing 3*2 and 2*3 etc
                    if (!sumArray.contains(theProduct)) {

                        sumArray.append( theProduct)
                    }
                }
            }
        }
        
        if sumArray.count > 0 {
        for k in 0...(sumArray.count - 1) {
            if sumArray[k] != inputLimit {
                theSum += sumArray[k]
                }
            }
        }
        
        return theSum
    }
}
