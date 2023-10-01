import Foundation

// Enum representing weekdays with associated raw String values.
enum Weekday: String, CaseIterable {
    case sunday = "Sunday"
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
}

// Enum representing possible week options with associated raw String values.
enum Which: String, CaseIterable {
    case first = "first"
    case second = "second"
    case third = "third"
    case fourth = "fourth"
    case last = "last"
    case teenth = "teenth"
}

struct Meetup {
    // Private properties to hold year, month, which, weekday, calendar, and formatter.
    private let year: Int
    private let month: Int
    private let which: Which
    private let weekday: Weekday
    private let calendar = Calendar.current
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd" // Date format as a string.
        return formatter
    }()
    
    // Initializer takes year, month, week, and weekday as parameters and initializes the properties.
    init(year: Int, month: Int, week: String, weekday: String) {
        self.year = year
        self.month = month
        // Using default values if invalid string is passed.
        self.which = Which(rawValue: week) ?? .first
        self.weekday = Weekday(rawValue: weekday) ?? .sunday
    }
    
    // Computed property to get the description of the meetup.
    var description: String {
        var components = DateComponents()
        components.year = year
        components.month = month
        // Converting weekday to the corresponding integer value.
        components.weekday = Weekday.allCases.firstIndex(of: weekday).map { $0 + 1 }  // Mapping Sunday to 1
        
        switch which {
        case .teenth:
            // Loop over the 'teenth' days and find the corresponding weekday.
            for day in 13...19 {
                components.day = day
                if let date = calendar.date(from: components),
                   calendar.component(.weekday, from: date) == components.weekday {
                    return formatter.string(from: date)
                }
            }
        case .first, .second, .third, .fourth:
            // Calculating the ordinal for the corresponding week and finding the date.
            components.weekdayOrdinal = Which.allCases.firstIndex(of: which).map { $0 + 1 } // Mapping first to 1
            if let date = calendar.date(from: components) {
                return formatter.string(from: date)
            }
        case .last:
            // Finding the last occurrence of the weekday in the month.
            components.weekdayOrdinal = -1
            if let date = calendar.date(from: components) {
                return formatter.string(from: date)
            }
        }
        // Return a descriptive string if no valid date is found.
        return "Invalid Date"
    }
}
