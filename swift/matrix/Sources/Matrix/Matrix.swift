import Foundation

//Solution goes in Sources

struct Matrix {
    
    var matrixArray = [[Int]]()
    
    var rows = [[Int]]()
    var columns = [[Int]]()
    
    init (_ input: String) {
        let rowDelimiter = CharacterSet.newlines
        // array of row strings
        let tempArray = input.components(separatedBy: rowDelimiter)
        
        // convert row components to ints, add to .rows
        for i in 0...(tempArray.count - 1) {
            let itemDelimiter = CharacterSet.whitespaces
            let rowString = tempArray[i].components(separatedBy: itemDelimiter)
            rows.append(rowString.compactMap { Int($0) })
            }
        
        // we have our row arrays, now create column ones
        let colCount = rows[0].count
        for j in 0...(colCount - 1) {
            columns.append([Int]())
            
            for k in 0...(rows.count - 1) {
                columns[j].append(rows[k][j])
            }
        }
    }
}
