import Foundation

//Solution goes in Sources
struct GradeSchool {
    var roster = [Int: [String]]()
    var sortedRoster: [Int: [String]] {
      get {
        var sortedRoster: [Int: [String]] = [:]
        for (key, value) in roster {
            var value = value
            value.sort()
            sortedRoster[key] = value
        }
        return sortedRoster
      }
    }
    
    mutating func addStudent(_ student: String, grade: Int) {
        roster[grade, default: []].append(student)
        }
    
    func studentsInGrade(_ grade: Int) -> [String] {
        roster[grade] ?? []
    }
}
