import UIKit

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

public struct QueueArray<T>: Queue {
    
    private var array: [T] = []
    public init() {
        
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var peek: T? {
        return array.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
    
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        return String(describing: array)
    }
}

public struct QueueStack<T>: Queue {
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    
    public init() {
        
    }
    
    public var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek: T? {
        return !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
}


var queue = QueueArray<Int>()
queue.dequeue()
queue.enqueue(1)
queue.enqueue(2)
queue.dequeue()
queue.peek




//public struct QueueLinkedList<T>: Queue {
//    private var list = DoublyLinkedList()
//
//    public init() {
//
//    }
//
//    public func enqueue(_ element: T) -> Bool {
//        list.append(element)
//        return true
//    }
//}
//
//
//public struct DoublyLinkedList {
//
//}
