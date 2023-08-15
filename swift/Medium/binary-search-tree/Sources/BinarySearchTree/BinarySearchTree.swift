import Foundation

//Solution goes in Sources

indirect enum BinarySearchTree {
    case node(data: Int, left: BinarySearchTree?, right: BinarySearchTree?)
    
    init(_ data: Int) {
        self = .node(data: data, left: nil, right: nil)
    }
    
    var data: Int {
        switch self {
        case let .node(data, _, _):
            return data
        }
    }
    
    var left: BinarySearchTree? {
        get {
            switch self {
            case let .node(_, left, _):
                return left
            }
        }
        set {
            self = .node(data: data, left: newValue, right: right)
        }
    }
    
    var right: BinarySearchTree? {
        get {
            switch self {
            case let .node(_, _, right):
                return right
            }
        }
        set {
            self = .node(data: data, left: left, right: newValue)
        }
    }
    
    mutating func insert(_ value: Int) {
        if value <= data {
            if var left = left {
                left.insert(value)
                self.left = left
            } else {
                self.left = BinarySearchTree(value)
            }
        } else {
            if var right = right {
                right.insert(value)
                self.right = right
            } else {
                self.right = BinarySearchTree(value)
            }
        }
    }
    
    func allData() -> [Int] {
        (left?.allData() ?? []) + [data] + (right?.allData() ?? [])
    }
}
