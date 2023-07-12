import Foundation

//Solution goes in Sources

struct Meetup {
    
    var myDateComponents = DateComponents()
    
    init(year: Int?, month: Int?) {
        myDateComponents.year   = year
        myDateComponents.month  = month
        // default to first day; we'll refine further
        myDateComponents.day    = 1
    }
    
    func day(_ weekday: Int, which: String ) -> String {

        // just grabbing the current user's systemwide calendar setting
        let calendar = Calendar.current
        
        // starts as first day of target month; we'll refine further
        let firstDayOfMonth = calendar.date(from: myDateComponents)!
        
        // 'EEEE' means -> "Monday", "Tuesday", etc.
        let dayNameDateFormatter = DateFormatter()
        dayNameDateFormatter.dateFormat = "EEEE"

        let firstDayName = dayNameDateFormatter.string(from: firstDayOfMonth)
        var firstDayInt = 0
        
        // convert firstDayName to an Int, just like the 'weekday' parameter
        switch firstDayName {
        case "Sunday":
            firstDayInt = 1
        case "Monday":
            firstDayInt = 2
        case "Tuesday":
            firstDayInt = 3
        case "Wednesday":
            firstDayInt = 4
        case "Thursday":
            firstDayInt = 5
        case "Friday":
            firstDayInt = 6
        case "Saturday":
            firstDayInt = 7
        default:
            // something went horribly awry
            return ""
        }

        // use firstDayInt to modify myDateComponents.day to 'first <target day> of month'
//        var firstTargetDayOfMonth = 1
        let daysInAWeek = 7
        let daysToAdd = (weekday - firstDayInt + daysInAWeek) % daysInAWeek

        let lastRange = calendar.range(of: .day, in: .month, for: firstDayOfMonth)
        let lastDay = lastRange?.count

        // get a mutable copy for return value
        var returnDateComponents = myDateComponents
        // modded to first target day of month
        returnDateComponents.day! += daysToAdd
        
        switch which {
        case "1st":
            break
        case "2nd":
            // week length is static, so just step forward from week 1 to X
            returnDateComponents.day! += (daysInAWeek)
        case "3rd":
            returnDateComponents.day! += (2 * daysInAWeek)
        case "4th":
            returnDateComponents.day! += (3 * daysInAWeek)
        case "last":
            while returnDateComponents.day! < lastDay! {
                returnDateComponents.day! += 7
            }
        case "teenth":
            // 12th is the last input which could produce a teenth
            while returnDateComponents.day! < 12 {
                returnDateComponents.day! += 7
            }
        default:
            break
        }
                
        let returnFormatter = DateFormatter()
        returnFormatter.dateFormat = "yyyy-MM-dd"
        return returnFormatter.string(from: calendar.date(from: returnDateComponents)!)
    }
}

