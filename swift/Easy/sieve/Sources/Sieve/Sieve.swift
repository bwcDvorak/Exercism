import Foundation

//Solution goes in Sources

struct Sieve {
    var primes = [Int]()
    
    init(_ input: Int) {
        var sieve = [Bool](repeating: true, count: input + 1)

        // one could code around needing these, I suppose...
        // but for now just set appropriately
        sieve[0] = false
        sieve[1] = false
        
        var p = 2
        while p * p <= input {
            if sieve[p] {
                var i = p * p
                while i <= input {
                    sieve[i] = false
                    i += p
                }
            }
            p += 1
        }
     
        for j in 2...input {
            if sieve[j] {
                primes.append(j)
            }
        }
    }
}
