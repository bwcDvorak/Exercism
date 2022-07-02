import Foundation

//Solution goes in Sources

struct Year {
    var isLeapYear: Bool
    
    init (calendarYear: Int) {
        // divisible by 4 has remainder of zero?
        let remainder4      = ((calendarYear % 4) == 0)
        // divisible by 100 with zero remainder?
        let remainder100    = ((calendarYear % 100) == 0)
        // divisible by 400 with remainder of zero?
        let remainder400    = ((calendarYear % 400) == 0)

        // remainder4 AND ( NOT remainder100 OR (remainder400))
        self.isLeapYear = (remainder4 && !remainder100) || remainder400
    }
}
