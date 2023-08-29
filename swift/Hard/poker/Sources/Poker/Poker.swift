//Solution goes in Sources

import Foundation

// Enum to represent the 4 suits of a card
enum CardSuit: String, CaseIterable {
    case hearts = "♡"
    case clubs = "♧"
    case diamonds = "♢"
    case spades = "♤"
}

// Enum to represent the ranks of a card
enum CardRank: String, CaseIterable {
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case jack = "J"
    case queen = "Q"
    case king = "K"
    case ace = "A"

    // Computes the integer value of the card's rank
        var value: Int {
            return CardRank.allCases.firstIndex(of: self)! + 2
    }
    
    // Computes the low value for aces in straights
    var lowValue: Int {
        return self == .ace ? 1 : self.value
    }
}

// Struct to represent a Poker card with a suit and rank
struct PokerCard {
    var suit: CardSuit
    var rank: CardRank

    init?(_ literal: String) {
        guard let suitString = literal.last,
              let suit = CardSuit(rawValue: String(suitString)) else { return nil }

        let rankString = String(literal.dropLast())
        guard let rank = CardRank(rawValue: rankString) else { return nil }

        self.suit = suit
        self.rank = rank
    }
}

// Enum to categorize poker hands
enum HandCategory: Int {
    case highCard = 1
    case onePair
    case twoPair
    case threeOfAKind
    case straight
    case flush
    case fullHouse
    case fourOfAKind
    case straightFlush
}

// Struct to encapsulate the score of a Poker hand
struct HandScore: Comparable {
    static func < (lhs: HandScore, rhs: HandScore) -> Bool {
        if lhs.category == rhs.category {
            if lhs.value == rhs.value {
                return lhs.secondaryValue < rhs.secondaryValue
            }
            return lhs.value < rhs.value
        }
        return lhs.category.rawValue < rhs.category.rawValue
    }

    let category: HandCategory
    let value: Int
    let secondaryValue: Int
}

// Enum to hold constants for poker rules
enum PokerRules {
    static let numberOfCardsInHand = 5
}

// Struct to represent a Poker hand
struct PokerHand: CustomStringConvertible {
    let handString: String // String representation of the hand
    let hand: [PokerCard]   // Array of PokerCard structs
    var score: HandScore!   // Score associated with this hand

    // Initialize PokerHand from a string
    init?(_ literal: String) {
        self.handString = literal  // Initialize the property here
        self.hand = literal
            .components(separatedBy: " ")
            .compactMap(PokerCard.init)

        if hand.count != PokerRules.numberOfCardsInHand {
            return nil
        }

        self.score = calculateScore()
    }

    // Textual description of the PokerHand
    var description: String {
        return handString
    }

    // Calculate the score for the hand
    private func calculateScore() -> HandScore {
        let groupedByRank = Dictionary(grouping: hand, by: { $0.rank })
        let sortedByRank = hand.sorted(by: { $0.rank.value < $1.rank.value })
        
        let sortedByLowValue = hand.sorted(by: { $0.rank.lowValue < $1.rank.lowValue })
        
        // Check for Flush and Straight
        let isFlushResult = isFlush()
        let straightHigh = isStraight(sorted: sortedByRank)
        let straightLow = isStraight(sorted: sortedByLowValue, usingLowValue: true)
        let isStraightResult = (straightHigh || straightLow)

        // Straight Flush
        if isFlushResult && (straightHigh || straightLow) {
            return HandScore(
                category: .straightFlush,
                value: straightHigh ? sortedByRank.last!.rank.value : sortedByLowValue.last!.rank.lowValue,
                secondaryValue: 0
            )
        }
        
        // Four of a Kind
        if let fourOfAKind = groupedByRank.first(where: { $1.count == 4 }) {
            let otherCard = hand.first(where: { $0.rank != fourOfAKind.key })!
            return HandScore(category: .fourOfAKind, value: fourOfAKind.key.value, secondaryValue: otherCard.rank.value)
        }

        // Full House
        if let threeOfAKind = groupedByRank.first(where: { $1.count == 3 }),
           let pair = groupedByRank.first(where: { $1.count == 2 }) {
            return HandScore(category: .fullHouse,
                            value: threeOfAKind.key.value,
                            secondaryValue: pair.key.value)
        }
        
        // Non-Straight Flushes
        if isFlushResult, !isStraightResult {
            let highestRankValue = hand.map { $0.rank.value }.max() ?? 0
            return HandScore(category: .flush, value: highestRankValue, secondaryValue: 0)
        }

        // Straight (but not Flush)
        if straightHigh || straightLow {
            // Choose the highest possible value for the straight
            let bestValue = straightHigh ? sortedByRank.last!.rank.value : sortedByLowValue.last!.rank.lowValue
            return HandScore(category: .straight, value: bestValue, secondaryValue: 0)
        }
        
        // Three of a Kind
        if let threeOfAKind = groupedByRank.first(where: { $1.count == 3 }) {
            let otherCards = hand.filter { $0.rank != threeOfAKind.key }
            let sortedOtherCards = otherCards.sorted(by: { $0.rank.value < $1.rank.value })
            let secondaryValue = sortedOtherCards[0].rank.value * 10 + sortedOtherCards[1].rank.value
            return HandScore(category: .threeOfAKind, value: threeOfAKind.key.value, secondaryValue: secondaryValue)
        }

        // Two Pair
        if let firstPair = groupedByRank.first(where: { $1.count == 2 }),
           let secondPair = groupedByRank.filter({ $1.count == 2 && $0 != firstPair.key }).last {
            let otherCard = hand.first(where: { $0.rank != firstPair.key && $0.rank != secondPair.key })!
            let highPairValue = max(firstPair.key.value, secondPair.key.value)
            let lowPairValue = min(firstPair.key.value, secondPair.key.value)
            let secondaryValue = highPairValue * 100 + lowPairValue * 10 + otherCard.rank.value
            return HandScore(category: .twoPair, value: highPairValue, secondaryValue: secondaryValue)
        }

        // One Pair
        if let firstPair = groupedByRank.first(where: { $1.count == 2 }) {
            let pairValue = firstPair.key.value
            let otherCards = hand.filter { $0.rank != firstPair.key }
            let otherCardValues = otherCards.map { $0.rank.value }.sorted(by: >)

            return HandScore(
                category: .onePair,
                value: pairValue,
                secondaryValue: otherCardValues[0] * 100 + otherCardValues[1] * 10 + otherCardValues[2]
            )
        }

        // Default case: High Card
        return HandScore(category: .highCard, value: hand.map { $0.rank.value }.max() ?? 0, secondaryValue: 0)
    }

    // Additional helper methods
    private func groupCardsByRank() -> [[PokerCard]] {
        return hand
            .reduce(into: [CardRank: [PokerCard]]()) { cardGroups, card in
                cardGroups[card.rank, default: []].append(card)
            }
            .values
            .sorted(by: { $0.count > $1.count })
    }

    private func sameSuit() -> Bool {
        guard let firstSuit = hand.first?.suit else { return false }
        return hand.allSatisfy { $0.suit == firstSuit }
    }

    private func consecutive(sorted: [PokerCard]) -> Bool {
        var previous = sorted.first!
        for card in sorted.dropFirst() {
            if card.rank.value != previous.rank.value + 1
                && !(card.rank == .ace && sorted.first!.rank == .two) {
                return false
            }
            previous = card
        }

        return true
    }
    
    private func isFlush() -> Bool {
        guard let firstSuit = hand.first?.suit else { return false }
        return hand.allSatisfy { $0.suit == firstSuit }
    }

    private func isStraight(sorted: [PokerCard], usingLowValue: Bool = false) -> Bool {
        var previous = sorted.first!
        for card in sorted.dropFirst() {
            let prevValue = usingLowValue ? previous.rank.lowValue : previous.rank.value
            let currentValue = usingLowValue ? card.rank.lowValue : card.rank.value
            if currentValue != prevValue + 1 {
                return false
            }
            previous = card
        }
        return true
    }

    
}

// Class to handle poker-related operations
class Poker {
    // Determines the best hand among an array of hands
    static func bestHand(_ hands: [String]) -> String? {
        return hands
            .compactMap(PokerHand.init)
            .sorted(by: { $0.score > $1.score })
            .first?
            .description // using handString property instead of description
    }
}
