extension Int {
    // Define a structure to hold the value and numeral representation of a Roman numeral.
    private struct RomanNumeral {
        let value: Int      // The numerical value of the Roman numeral.
        let numeral: String // The corresponding Roman numeral string.
    }
    
    // Array of RomanNumeral instances representing common Roman numeral values.
    private static let romanNumerals: [RomanNumeral] = [
        RomanNumeral(value: 1000, numeral: "M"),
        RomanNumeral(value: 900, numeral: "CM"),
        RomanNumeral(value: 500, numeral: "D"),
        RomanNumeral(value: 400, numeral: "CD"),
        RomanNumeral(value: 100, numeral: "C"),
        RomanNumeral(value: 90, numeral: "XC"),
        RomanNumeral(value: 50, numeral: "L"),
        RomanNumeral(value: 40, numeral: "XL"),
        RomanNumeral(value: 10, numeral: "X"),
        RomanNumeral(value: 9, numeral: "IX"),
        RomanNumeral(value: 5, numeral: "V"),
        RomanNumeral(value: 4, numeral: "IV"),
        RomanNumeral(value: 1, numeral: "I")
    ]
    
    // Method to convert the integer to its corresponding Roman numeral.
    func toRomanNumeral() -> String {
        var remainingValue = self // Store the remaining value to be converted.
        var result = ""           // Initialize an empty string to store the resulting Roman numeral.
        
        // Iterate through each Roman numeral value and add its corresponding numeral.
        for numeral in Int.romanNumerals {
            while remainingValue >= numeral.value {
                result += numeral.numeral
                remainingValue -= numeral.value
            }
        }
        
        return result
    }
}
