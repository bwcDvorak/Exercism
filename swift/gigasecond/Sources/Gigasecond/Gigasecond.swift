import Foundation

//Solution goes in Sources

struct Gigasecond {
    var description: String

    init? (from: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        var futureTime = dateFormatter.date(from: from)
        futureTime = futureTime?.addingTimeInterval(1000000000)
        
        description = dateFormatter.string(from: futureTime ?? Date())
    }
}
