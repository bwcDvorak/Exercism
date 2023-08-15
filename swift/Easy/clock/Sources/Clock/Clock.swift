import Foundation

//Solution goes in Sources
struct Clock {
    static let minsPerHour = 60
    static let hoursPerDay = 24
    static var minsPerDay: Int {minsPerHour * hoursPerDay}
    
    var maxMins: Int
    var myHours:    Int {maxMins / Clock.minsPerHour}
    var myMins:     Int {maxMins % Clock.minsPerHour}
    
    init(hours: Int, minutes: Int = 0) {
        maxMins = ((hours * Clock.minsPerHour) + minutes) % Clock.minsPerDay
        
        if (maxMins < 0) {
            maxMins += Clock.minsPerDay
        }
    }
    
    func add(minutes: Int) -> Self {
        Clock(hours: 0, minutes: (maxMins + minutes))
    }
    
    func subtract(minutes: Int) -> Self {
        Clock(hours: 0, minutes: (maxMins - minutes))
    }
}

// extensions docs - https://docs.swift.org/swift-book/LanguageGuide/Extensions.html
// custom string convertibles - https://developer.apple.com/documentation/swift/customstringconvertible
// equatable - https://developer.apple.com/documentation/swift/equatable
extension Clock: CustomStringConvertible {
    var description: String {
        String(format: "%02d:%02d", myHours, myMins)
    }
}

extension Clock: Equatable {}
