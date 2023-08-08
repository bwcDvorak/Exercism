import Foundation

func isValidLuhn(_ number: String) -> Bool {
    // Check if the input contains any non-digit character (other than space)
    let invalidCharacters = number.filter { !$0.isNumber && $0 != " " }
    guard invalidCharacters.isEmpty else {
        return false
    }
    
    // Remove any non-digit characters (including spaces) from the input number
    let cleanNumber = number.filter { $0.isNumber }
    
    // Check if the number is at least two digits long
    guard cleanNumber.count >= 2 else {
        return false
    }
    
    // Convert the number into an array of digits
    var digits = cleanNumber.compactMap { Int(String($0)) }
    
    // Double every second digit from the right
    for i in (0..<digits.count).reversed() where (digits.count - i) % 2 == 0 {
        digits[i] *= 2
        
        // If the doubling results in a number greater than 9, subtract 9
        if digits[i] > 9 {
            digits[i] -= 9
        }
    }
    
    // Sum all the digits in the modified number
    let sum = digits.reduce(0, +)
    
    // Check if the total sum is divisible by 10
    return sum % 10 == 0
}
