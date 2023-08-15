import Foundation

//Solution goes in Sources

struct Triangle {
    var kind: String
    
    init(_ a: Double, _ b: Double, _ c: Double) {
        
        // assume not triangle, exit early if suspicion confirmed
        kind = "ErrorKind"
        guard a > 0 && b > 0 && c > 0 else { return }
        guard ( a + b >= c ) && ( b + c >= a ) && ( c + a >= b ) else { return }
        
        // now figure out which type of triangle we are
        
        if (a == b) || (a == c) || (b == c) { kind = "Isosceles" }
        // if previous test fired but all sides are equal, override
        if (a == b) && (b == c) { kind = "Equilateral" }
        // none of the sides match? scalene.
        if !((a == b) || (a == c) || (b == c)) { kind = "Scalene" }
    }
}
