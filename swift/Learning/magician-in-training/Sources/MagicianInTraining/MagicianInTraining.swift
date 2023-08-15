func getCard(at index: Int, from stack: [Int]) -> Int {
    return stack[index]
}

func setCard(at index: Int, in stack: [Int], to newCard: Int) -> [Int] {
    var newStack = stack
    if index >= 0 && index < stack.count {
        newStack[index] = newCard
    } 
    return newStack
}

func insert(_ newCard: Int, atTopOf stack: [Int]) -> [Int] {
    var newStack = stack
    newStack.append(newCard)
    return newStack
}

func removeCard(at index: Int, from stack: [Int]) -> [Int] {
    var newStack = stack
    if index >= 0 && index < stack.count {
        newStack.remove(at: index)
    }
    return newStack
}

func removeTopCard(_ stack: [Int]) -> [Int] {
    var newStack = stack
    if !newStack.isEmpty {
        newStack.removeLast()
    }
    return newStack
}

func insert(_ newCard: Int, atBottomOf stack: [Int]) -> [Int] {
    var newStack: [Int] = [newCard]
        newStack.append(contentsOf: stack)
        return newStack
}

func removeBottomCard(_ stack: [Int]) -> [Int] {
    var newStack = stack
    newStack.removeFirst()
    return newStack
}

func checkSizeOfStack(_ stack: [Int], _ size: Int) -> Bool {
  return stack.count == size
}

func evenCardCount(_ stack: [Int]) -> Int {
    var count = 0
    for n in stack {
        if n.isMultiple(of: 2) {
            count += 1
        }
    }
    return count
}
