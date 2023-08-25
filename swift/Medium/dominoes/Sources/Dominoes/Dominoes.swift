public struct Dominoes {
    
    // Store the given dominoes as a property
    let input: [(Int, Int)]
    
    // Initialize the struct with dominoes
    init(_ input: [(Int, Int)]) {
        self.input = input
    }
    
    // Helper method to check if two dominoes can be chained
    private func canChain(firstDomino: (Int, Int), secondDomino: (Int, Int)) -> Bool {
        return firstDomino.1 == secondDomino.0
    }
    
    // Helper method to reverse a domino
    private func reverse(domino: (Int, Int)) -> (Int, Int) {
        return (domino.1, domino.0)
    }
    
    // Recursive function to build a domino chain
    private func buildChain(currentChain: [(Int, Int)], remainingDominoes: [(Int, Int)]) -> Bool {
        // Base case: If no remaining dominoes, check if the current chain is valid
        if remainingDominoes.isEmpty {
            return currentChain.isEmpty || (currentChain.first!.0 == currentChain.last!.1)
        }
        
        // Initialize working copies of currentChain and remainingDominoes
        var localChain = currentChain
        var localRemainingDominoes = remainingDominoes
        
        // If the current chain is empty, start it with the first remaining domino
        if localChain.isEmpty {
            localChain.append(localRemainingDominoes.removeFirst())
            return buildChain(currentChain: localChain, remainingDominoes: localRemainingDominoes)
        }
        
        // Get the last domino in the current chain
        let lastDominoInChain = localChain.last!
        
        // Iterate through remaining dominoes to find a match
        for (index, candidateDomino) in localRemainingDominoes.enumerated() {
            var nextDominoInChain: (Int, Int)?
            
            // Check if the candidate domino can be chained as-is or reversed
            if canChain(firstDomino: lastDominoInChain, secondDomino: candidateDomino) {
                nextDominoInChain = candidateDomino
            } else if canChain(firstDomino: lastDominoInChain, secondDomino: reverse(domino: candidateDomino)) {
                nextDominoInChain = reverse(domino: candidateDomino)
            }
            
            // If a match is found, attempt to extend the chain
            if let nextDomino = nextDominoInChain {
                let newRemaining = Array(localRemainingDominoes[..<index] + localRemainingDominoes[(index+1)...])
                
                if buildChain(currentChain: localChain + [nextDomino], remainingDominoes: newRemaining) {
                    return true
                }
            }
        }
        
        // If no matches are found, return false
        return false
    }
    
    // Property to check if the given dominoes can be chained
    var chained: Bool {
        return buildChain(currentChain: [], remainingDominoes: self.input)
    }
}
