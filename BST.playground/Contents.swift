import UIKit

public class BinaryNode<Element> {
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(value: Element) {
        self.value = value
    }
}

public struct BinarySearchTree<Element: Comparable> {
    public private(set) var root: BinaryNode<Element>?
    
    public init() {
        
    }
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String{
        guard let root = root else {
            return "empty tree"
        }
        return String(describing: root)
    }
}

extension BinarySearchTree {
    
    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryNode<Element>?, value: Element)
        -> BinaryNode<Element> {
            // 1
            guard let node = node else {
                return BinaryNode(value: value)
            }
            // 2
            if value < node.value {
                node.leftChild = insert(from: node.leftChild, value: value)
            } else {
                node.rightChild = insert(from: node.rightChild, value: value)
            }
            // 3
            return node
    }
    
    public func contains(_ value: Element) -> Bool {
        // 1
        var current = root
        // 2
        while let node = current {
            // 3
            if node.value == value {
                return true
            }
            // 4
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
    
    
}

var bst = BinarySearchTree<Int>()
for i in 0..<5 {
    bst.insert(i)
}
print(bst)
