import Foundation

//Solution goes in Sources

extension Array where Element == String {
    
    func recite () -> String {
        
        guard !self.isEmpty else { return ""}
        
        var returnText = ""
        let firstElement = self.first
        let selfCount = self.count
        
        for i in 0...(selfCount-1) {
            if i < (selfCount-1) {
                let theElement = self[i]
                let nextElement = self[i+1]
                
                returnText += "For want of a \(theElement) the \(nextElement) was lost.\n"
            } else {
                
                // returnText += "And all for the want of a \(firstElement)."
                // version above produces a "String interpolation produces a debug description for an optional value; did you mean to make this explicit?" warning.
                // version below, supplying an unneccesary default value, dispels the warning.
                returnText += "And all for the want of a \(firstElement ?? "jabberwocky")."
            }
        }
        
        return returnText
    }
}
