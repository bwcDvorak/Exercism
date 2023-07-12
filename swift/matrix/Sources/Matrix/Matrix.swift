import Foundation

//Solution goes in Sources

struct Matrix {
    
    var rows = [[Int]]()
    var columns = [[Int]]()
    
    init (_ input: String) {
        let rowDelimiter = CharacterSet.newlines
        let itemDelimiter = CharacterSet.whitespaces

        // array of row strings
        let tempArray = input.components(separatedBy: rowDelimiter)
        
        // convert row components to ints, add to .rows
        for i in 0...(tempArray.count - 1) {
            let rowString = tempArray[i].components(separatedBy: itemDelimiter)
            rows.append(rowString.compactMap { Int($0) })
            }
        
        // use row arrays to create column ones
        let colCount = rows[0].count
        for j in 0...(colCount - 1) {
            columns.append([Int]())
            
            for k in 0...(rows.count - 1) {
                columns[j].append(rows[k][j])
            }
        }
    }
}
