import Foundation
import XCTest

func newScoreBoard() -> [String: Int] {
    let myDict = [String: Int]()
    return myDict
}

func addPlayer(_ scores: inout [String: Int], _ name: String, _ score: Int = 0) {
    return scores[name] = score
}

func removePlayer(_ scores: inout [String: Int], _ name: String) {
    return scores[name] = nil
}

func resetScore(_ scores: inout [String: Int], _ name: String) {
    return scores[name] = 0
}

func updateScore(_ scores: inout [String: Int], _ name: String, _ delta: Int) {
    var newScore = scores[name] ?? 0
    newScore += delta
    scores[name] =  newScore
}

func orderByPlayers(_ scores: [String: Int]) -> [(String, Int)] {
    let sortedScores = scores.sorted {(first, second) -> Bool in
        return first.key < second.key
    }
    return sortedScores
}

func orderByScores(_ scores: [String: Int]) -> [(String, Int)] {
    let sortedScores = scores.sorted {(first, second) -> Bool in
        return first.value > second.value
    }
    return sortedScores
}
