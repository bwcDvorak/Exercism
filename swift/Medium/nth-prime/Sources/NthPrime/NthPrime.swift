import Foundation

enum PrimeError: Error, Equatable {
    case noZerothPrime
}

func nthPrime(_ n: Int) throws -> Int {
    guard n > 0 else {
        throw PrimeError.noZerothPrime
    }

    var count = 0  // for counting primes
    var num = 2  // current number to check

    while true {
        if isPrime(num) {
            count += 1
            if count == n {
                return num
            }
        }
        num += 1
    }
}

private func isPrime(_ num: Int) -> Bool {
    if num <= 1 { return false }
    if num <= 3 { return true }
    if num % 2 == 0 || num % 3 == 0 { return false }
    var i = 5
    while i * i <= num {
        if num % i == 0 || num % (i + 2) == 0 { return false }
        i += 6
    }
    return true
}
