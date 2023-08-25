import Foundation

enum BoardError: Error {
    case invalidInput
}

class Board {
    let input: [[Character]]
    
    init(_ input: [String]) {
        self.input = input.map { Array($0) }  // Convert each string to an array of characters
    }
    
    // transform board according to adjacent mine counts
    func transform() throws -> [String] {
        // Check if the input is empty
        guard !input.isEmpty else { return [] }
        
        var output = input  // Make a copy of the input for modification
        
        for row in 0..<input.count {
            for col in 0..<input[row].count {
                // Skip cells that are mines
                if input[row][col] == "*" {
                    continue
                }
                
                // Count adjacent mines for the current cell
                let count = countAdjacentMines(row: row, col: col)
                
                // Update the cell based on the count of adjacent mines
                if count == 0 {
                    output[row][col] = " "
                } else {
                    output[row][col] = Character("\(count)")
                }
            }
        }
        
        // Convert output back to array of strings and return
        return output.map { String($0) }
    }
    
    // Helper function to count the number of adjacent mines for a given cell
    func countAdjacentMines(row: Int, col: Int) -> Int {
        var count = 0
        
        // Loop through adjacent cells
        for i in -1...1 {
            for j in -1...1 {
                let newRow = row + i
                let newCol = col + j
                
                // Check if the adjacent cell is within the board and is a mine
                if newRow >= 0, newRow < input.count, newCol >= 0, newCol < input[newRow].count, input[newRow][newCol] == "*" {
                    count += 1
                }
            }
        }
        
        return count  
    }
}
