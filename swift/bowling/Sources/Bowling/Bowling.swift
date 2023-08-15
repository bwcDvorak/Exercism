enum BowlingError: Error {
    case negativePins
    case tooManyPinsInFrame
    case gameInProgress
    case gameIsOver
}

class Bowling {
    private var rolls: [Int] = []
    
    init(_ rolls: [Int]) {
        self.rolls = rolls
    }
    
    func roll(pins: Int) throws {
        if pins < 0 {
            throw BowlingError.negativePins
        }
        
        if pins > 10 {
            throw BowlingError.tooManyPinsInFrame
        }

        // Checking if the game is over (10 frames without bonuses).
        if rolls.count == 20 && (rolls[18] + rolls[19] < 10) {
            throw BowlingError.gameIsOver
        }

        if rolls.count < 18 {
            if rolls.count % 2 == 1 && (rolls.last! + pins) > 10 {
                throw BowlingError.tooManyPinsInFrame
            }
        } else if rolls.count >= 18 && rolls.count < 21 {
            if pins == 10 {
                if rolls.count == 20 && rolls[rolls.count - 1] != 10 {
                    throw BowlingError.tooManyPinsInFrame
                }
            } else if rolls.count == 20 && (rolls.last! + pins) > 10 {
                throw BowlingError.tooManyPinsInFrame
            }
        } else if rolls.count >= 21 {
            throw BowlingError.gameIsOver
        }

        rolls.append(pins)
    }


    
    func score() throws -> Int {
        var score = 0
        var rollIndex = 0
        
        for frame in 0..<10 {
            if rollIndex >= rolls.count {
                throw BowlingError.gameInProgress
            }
            
            if isStrike(rollIndex) {
                if frame == 9 && rollIndex + 2 >= rolls.count {
                    throw BowlingError.gameInProgress
                }
                
                score += 10 + strikeBonus(for: rollIndex)
                rollIndex += 1
            } else if rollIndex + 1 < rolls.count && isSpare(rollIndex) {
                if frame == 9 && rollIndex + 2 >= rolls.count {
                    throw BowlingError.gameInProgress
                }
                
                score += 10 + spareBonus(for: rollIndex)
                rollIndex += 2
            } else {
                score += frameScore(for: rollIndex)
                rollIndex += 2
            }
            
            // For the 10th frame, if there are bonus rolls, it shouldn't consider them as a new frame.
            if frame == 9 {
                rollIndex = rolls.count
            }
        }
        
        if rollIndex != rolls.count {
            throw BowlingError.gameInProgress
        }
        
        return score
    }




    private func isStrike(_ rollIndex: Int) -> Bool {
        return rolls[rollIndex] == 10
    }

    private func isSpare(_ rollIndex: Int) -> Bool {
        return rollIndex + 1 < rolls.count && (rolls[rollIndex] + rolls[rollIndex + 1] == 10)
    }

    private func strikeBonus(for rollIndex: Int) -> Int {
        if rollIndex + 2 < rolls.count {
            return rolls[rollIndex + 1] + rolls[rollIndex + 2]
        }
        return 0
    }

    private func spareBonus(for rollIndex: Int) -> Int {
        if rollIndex + 2 < rolls.count {
            return rolls[rollIndex + 2]
        }
        return 0
    }

    private func frameScore(for rollIndex: Int) -> Int {
        if rollIndex + 1 < rolls.count {
            return rolls[rollIndex] + rolls[rollIndex + 1]
        }
        return 0
    }
    
}
