import Foundation

//Solution goes in Sources

struct Triplet {

    let A: Decimal
    let B: Decimal
    let C: Decimal
    let sum: Int
    let product: Int
    let isPythagorean: Bool

    init (_ a: Int, _ b: Int,_ c: Int) {
        A = Decimal(a)
        B = Decimal(b)
        C = Decimal(c)
        
        sum = a + b + c
        product = a * b * c
        isPythagorean = (pow(A, 2) + pow(B, 2) == pow(C, 2)) && (A < B && B < C)
        
    }
    
    // lesson really does a poor job explaining what this func should do
    static func fromWhere(_ minFactor: Int = 2, maxFactor: Int, sum: Int? = nil) -> [Triplet] {
        var returnValue = [Triplet]()
        
        let productSquared = maxFactor * maxFactor
        
        for a in minFactor...(maxFactor - 2) {
            for b in (a + 1)...(maxFactor - 1) {
                let cSquared = (a * a) + (b * b)
                guard cSquared <= productSquared else {
                    continue
                }
                let c = Int(sqrt(Double(cSquared)))
                if c * c == cSquared {
                    let newTriplet = Triplet(a, b, c)
                    if newTriplet.sum == sum ?? newTriplet.sum {
                        returnValue.append(newTriplet)
                    }
                }
                
            }
        }
        
        return returnValue
    }
}
