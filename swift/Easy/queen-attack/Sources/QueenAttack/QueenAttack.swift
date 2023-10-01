import Foundation

enum QueenError: Error, Equatable {
    case invalidCoordinates
    case inValidRow
    case inValidColumn
}

struct Queen {
    
    var row: Int
    var column: Int
    
    
    init(row: Int, column: Int) throws {
        // Check if row is not within the valid range of 0...7
        if !(0...7).contains(row) {
            throw QueenError.inValidRow
        }
        
        // It’s still good to check column here and throw a specific error if needed
        if !(0...7).contains(column) {
            throw QueenError.inValidColumn // Assuming you have also added inValidColumn to QueenError enum
        }
        
        self.row = row
        self.column = column
        
        // As we have already validated row and column, we could theoretically omit this check,
        // or leave it here as a safeguard.
        if !Queen.validateCoordinates(row, column) {
            throw QueenError.invalidCoordinates
        }
    }
    
    private static func validateCoordinates(_ row: Int, _ column: Int) -> Bool {
        return (0...7).contains(row) && (0...7).contains(column)
    }
    
    func canAttack(other: Queen) -> Bool {
        // Check if they are in the same row
        if self.row == other.row {
            return true
        }
        
        // Check if they are in the same column
        if self.column == other.column {
            return true
        }
        
        // Check if they are on the same diagonal
        if abs(self.row - other.row) == abs(self.column - other.column) {
            return true
        }
        
        // If none of the above conditions are met, the queens can't attack each other
        return false
    }
}
