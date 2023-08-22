import Foundation

//Solution goes in Sources

struct PalindromeProducts {
    struct Palindrome {
        let value: Int
        let factor: [Int]
    }

    let maxFactor: Int
    let minFactor: Int
    var largest: Palindrome {
        return findPalindromeProduct(largest: true)
    }
    var smallest: Palindrome {
        return findPalindromeProduct(largest: false)
    }

    init(maxFactor: Int, minFactor: Int = 1) {
        self.maxFactor = maxFactor
        self.minFactor = minFactor
    }

    private func isPalindrome(_ number: Int) -> Bool {
        let stringRepresentation = String(number)
        return stringRepresentation == String(stringRepresentation.reversed())
    }

    private func findPalindromeProduct(largest: Bool) -> Palindrome {
        var palindromeProduct: Int? = nil
        var factors: [Int] = []

        if largest {
            for i in (minFactor...maxFactor).reversed() {
                for j in (i...maxFactor).reversed() {
                    let product = i * j
                    if isPalindrome(product) {
                        if palindromeProduct == nil || product > palindromeProduct! {
                            palindromeProduct = product
                            factors = [i, j]
                        }
                    }
                }
            }
        } else {
            for i in minFactor...maxFactor {
                for j in i...maxFactor {
                    let product = i * j
                    if isPalindrome(product) {
                        if palindromeProduct == nil || product < palindromeProduct! {
                            palindromeProduct = product
                            factors = [i, j]
                        }
                    }
                }
            }
        }

        return Palindrome(value: palindromeProduct ?? 0, factor: factors)
    }
}

