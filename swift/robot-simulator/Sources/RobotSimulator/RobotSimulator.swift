import Foundation

//Solution goes in Sources

enum Direction {
    case north
    case east
    case south
    case west
}

enum Moves {
    case turnLeft
    case advance
    case turnRight
}

struct SimulatedRobot {
    
    var bearing: Direction = .north
    var coordinates: [Int] = [0, 0]
    
    // sets the direction no matter how many turns required
    mutating func orient (_ direction: Direction){
        bearing = direction
    }
    
    mutating func turnLeft() {
        switch bearing {
        case .north:
            bearing = .west
        case .east:
            bearing = .north
        case .south:
            bearing = .east
        case .west:
            bearing = .south
        }
    }
    
    mutating func turnRight() {
        switch bearing {
        case .north:
            bearing = .east
        case .east:
            bearing = .south
        case .south:
            bearing = .west
        case .west:
            bearing = .north
        }
    }
    
    mutating func at( x: Int, y: Int) {
        coordinates = [x, y]
    }
    
    mutating func advance() {
        let oldX = self.coordinates[0]
        let oldY = self.coordinates[1]
        
        switch bearing {
        case .north:
            coordinates = [oldX, (oldY + 1)]
        case .east:
            coordinates = [(oldX + 1), oldY]
        case .south:
            coordinates = [oldX, (oldY - 1)]
        case .west:
            coordinates = [(oldX - 1), oldY]
        }
    }

    func instructions(_ string: String) -> [Moves] {
        var instructions: [Moves] = []
        
        for char in string {
            switch char {
            case "L":
                instructions.append(.turnLeft)
            case "R":
                instructions.append(.turnRight)
            case "A":
                instructions.append(.advance)
            default:
                break
            }
        }
        return instructions
    }
    
    mutating func place(x: Int, y: Int, direction: Direction) {
        at(x: x, y: y)
        orient(direction)
    }
 
    mutating func evaluate(_ inputString: String) {
        let instructions = self.instructions(inputString)
        
        for instruction in instructions {
            switch instruction {
            case .turnLeft:
                turnLeft()
            case .advance:
                advance()
            case .turnRight:
                turnRight()
            }
        }
    }
    
}
