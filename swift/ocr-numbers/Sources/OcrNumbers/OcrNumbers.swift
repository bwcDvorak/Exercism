struct OCR {
    enum Numbers: Equatable, CustomStringConvertible {
        case zero, one, two, three, four, five, six, seven, eight, nine
        
        static let all: [Numbers] = [.zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine]
        
        var representation: [String] {
            switch self {
            case .zero:  return [" _ ", "| |", "|_|"]
            case .one:   return ["   ", "  |", "  |"]
            case .two:   return [" _ ", " _|", "|_ "]
            case .three: return [" _ ", " _|", " _|"]
            case .four:  return ["   ", "|_|", "  |"]
            case .five:  return [" _ ", "|_ ", " _|"]
            case .six:   return [" _ ", "|_ ", "|_|"]
            case .seven: return [" _ ", "  |", "  |"]
            case .eight: return [" _ ", "|_|", "|_|"]
            case .nine:  return [" _ ", "|_|", " _|"]
            }
        }
        
        var description: String {
            switch self {
            case .zero: return "0"
            case .one: return "1"
            case .two: return "2"
            case .three: return "3"
            case .four: return "4"
            case .five: return "5"
            case .six: return "6"
            case .seven: return "7"
            case .eight: return "8"
            case .nine: return "9"
            }
        }
    }

    enum OCRError: Error {
        case invalidNumberOfLines
        case invalidNumberOfColumns
    }
    
    let text: String
    
    init(_ text: String) throws {
        let lines = text.split(separator: "\n")
        guard lines.count % 4 == 0 else { throw OCRError.invalidNumberOfLines }
        guard lines.allSatisfy({ $0.count % 3 == 0 }) else { throw OCRError.invalidNumberOfColumns }
        self.text = text
    }
    
    func converted() -> String {
        let lines = text.split(separator: "\n").map { String($0) }
        let allLines = splitLines(lines)
        let count = (lines.first?.count ?? 0) / 3
        
        let result = allLines.map { line in
            (0..<count).map { idx in
                let split = split(line, count: idx)
                return findNumber(for: split)
            }.joined()
        }
        
        return result.joined(separator: ",")
    }
    
    private func findNumber(for line: [String]) -> String {
        if let number = Numbers.all.first(where: { $0.representation == line }) {
            return "\(number)"
        }
        return "?"
    }
    
    private func split(_ all: [String], count: Int) -> [String] {
        let line = all.first!
        let startIdx = line.index(line.startIndex, offsetBy: count * 3)
        let endIdx = line.index(startIdx, offsetBy: 3)
        return all.map({ $0[startIdx..<endIdx] }).dropLast().map { String($0) }
    }
    
    private func splitLines(_ all: [String]) -> [[String]] {
        return all.chunked(into: 4)
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
