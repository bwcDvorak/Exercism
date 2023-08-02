import Foundation

// Solution goes in Sources

struct Crypto {
    let normalizePlaintext: String
    
    // Initialize the Crypto struct with a given plaintext
    init(_ plaintext: String) {
        // Filter out non-letter, non-number, and whitespace characters, including punctuation
        normalizePlaintext = plaintext.lowercased().filter { $0.isLetter || $0.isNumber }
    }
    
    // Compute the size of the rectangle based on the length of the plaintext
    var size: Int {
        let squareRoot = sqrt(Double(normalizePlaintext.count))
        let roundedSquareRoot = Int(squareRoot.rounded())

        // Check if the rounded square root is a perfect square
        if roundedSquareRoot * roundedSquareRoot == normalizePlaintext.count {
            return roundedSquareRoot // Output square root if it's a perfect square
        } else {
            return Int(ceil(squareRoot)) // Round up to the next largest integer if not
        }
    }

    // Divide the normalized plaintext into segments of equal length
    var plaintextSegments: [String] {
        var segments: [String] = []

        var startIndex = normalizePlaintext.startIndex
        while startIndex < normalizePlaintext.endIndex {
            let endIndex = normalizePlaintext.index(startIndex, offsetBy: size, limitedBy: normalizePlaintext.endIndex) ?? normalizePlaintext.endIndex
            let segment = String(normalizePlaintext[startIndex..<endIndex])
            segments.append(segment.trimmingCharacters(in: .whitespacesAndNewlines))
            startIndex = endIndex
        }

        // Adjust segments to maintain the upper limit of .size on the segment lengths
        let adjustedSegments = adjustSegments(segments)

        return adjustedSegments
    }

    // Adjust segments that are longer than the defined size
    private func adjustSegments(_ segments: [String]) -> [String] {
        var adjustedSegments: [String] = []

        for segment in segments {
            if segment.count <= size {
                adjustedSegments.append(segment)
            } else {
                let segmentSize = segment.count / (size + 1)
                var remainder = segment.count % (size + 1)
                
                var startIndex = segment.startIndex
                var endIndex = segment.index(startIndex, offsetBy: segmentSize + (remainder > 0 ? 1 : 0))
                
                for _ in 0..<(size + 1) {
                    let subSegment = segment[startIndex..<endIndex]
                    adjustedSegments.append(String(subSegment))

                    startIndex = endIndex
                    endIndex = segment.index(startIndex, offsetBy: segmentSize + (remainder > 0 ? 1 : 0))
                    
                    if remainder > 0 {
                        remainder -= 1
                    }
                }
            }
        }

        return adjustedSegments
    }

    // Rotate the plaintext segments to create the ciphertext
    private var rotatedPlaintextSegments: [String] {
        var returnArray: [String] = []
        
        for columnIndex in 0..<size {
            var segment = ""
            for rowIndex in 0..<size {
                let charIndex = columnIndex + rowIndex * size
                if charIndex < plaintextSegments.joined().count {
                    let char = plaintextSegments.joined()[plaintextSegments.joined().index(plaintextSegments.joined().startIndex, offsetBy: charIndex)]
                    segment.append(char)
                }
            }
            returnArray.append(segment)
        }
        
        return returnArray
    }
    
    // Combine rotated plaintext segments to create the ciphertext
    var ciphertext: String {
        return rotatedPlaintextSegments.joined()
    }

    // Normalize the ciphertext by inserting spaces at regular intervals
    var normalizeCiphertext: String {
        // Calculate the largest square root whose square is less than the length of the ciphertext
        let largestSquareRoot = Int(floor(sqrt(Double(ciphertext.count))))

        // Insert spaces after every `largestSquareRoot` characters in the ciphertext
        var spacedCiphertext = ""
        var currentIndex = ciphertext.startIndex

        while currentIndex < ciphertext.endIndex {
            let endIndex = ciphertext.index(currentIndex, offsetBy: largestSquareRoot, limitedBy: ciphertext.endIndex) ?? ciphertext.endIndex
            spacedCiphertext += String(ciphertext[currentIndex..<endIndex])
            currentIndex = endIndex

            if currentIndex < ciphertext.endIndex {
                spacedCiphertext += " "
            }
        }

        return spacedCiphertext
    }
}
