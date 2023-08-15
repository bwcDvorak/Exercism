import Foundation

//Solution goes in Sources

struct PascalsTriangle {
    
    var rows = [[Int]]()
    
    init (_ input: Int) {
        
        // no tests input negative row numbers, but...
        guard input >= 0 else { return }
        
        for i in 0..<input {
            var nextRow = [Int]()
            
            for j in 0...i {
                if j == 0 || j == i {
                    nextRow.append(1)
                } else {
                    let sum = rows[i-1][j-1] + rows [i-1][j]
                    nextRow.append(sum)
                }
            }
            rows.append(nextRow)
        }
    }
}
