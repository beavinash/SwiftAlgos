import UIKit

public struct Stack<Element> {
    private var storage: [Element] = []
    
    init() {
        
    }
    
//    public init(_ elements: [Element]) {
//        self.storage = elements
//    }
    
    public mutating func push(_ value: Element) {
        storage.append(value)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    public func peek() -> Element? {
        return storage.last
    }
    
    public var isEmpty: Bool {
        return peek() == nil
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        let topDivider = "-----top-----\n"
        let bottomDivider = "\n----------"
        
        let stackElements = storage.map {"\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}

var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)

print(stack)

print("pop")
if let lastElement = stack.pop() {
    assert(3 == lastElement)
    print(lastElement)
}

stack.peek()
stack.isEmpty
