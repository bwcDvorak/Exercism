import Foundation

//Solution goes in Sources

struct Say {
    static func say(_ input: Int) -> String? {
        guard input >= 0 && input < 1_000_000_000_000 else {
            return nil
        }

        let sayFormatter = NumberFormatter()
        // dear apple thank you for .spellOut
        sayFormatter.numberStyle = .spellOut
        
        return sayFormatter.string(from: NSNumber(value: input)) ?? ""
    }
}
