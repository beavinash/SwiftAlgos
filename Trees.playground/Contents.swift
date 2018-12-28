import UIKit

public class TreeNode<T> {
    public var value: T
    public var children: [TreeNode] = []
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func add(_ child: TreeNode) {
        children.append(child)
    }
    
    
}

extension TreeNode {
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit: visit)
        }
    }
}


//var treeNode = TreeNode<Int>(1)
//treeNode.add(TreeNode(2))
//treeNode.add(TreeNode(3))
//print(treeNode.children)

//let beverages = TreeNode("Beverages")
//
//let hot = TreeNode("Hot")
//let cold = TreeNode("Cold")
//
//beverages.add(hot)
//beverages.add(cold)
//
//print(beverages.children)
//print(beverages)

func makeBeverageTree() -> TreeNode<String> {
    let tree = TreeNode("Beverages")
    
    let hot = TreeNode("Hot")
    let cold = TreeNode("Cold")
    
    let tea = TreeNode("Tea")
    let coffee = TreeNode("Coffee")
    let cocoa = TreeNode("Cocoa")
    
    let black = TreeNode("Black")
    let green = TreeNode("Green")
    let chai = TreeNode("Chai")
    
    let soda = TreeNode("Soda")
    let milk = TreeNode("Milk")
    
    let gingerAle = TreeNode("Ginger Ale")
    let bitterLemon = TreeNode("Bitter Lemon")
    
    tree.add(hot)
    tree.add(cold)
    
    hot.add(tea)
    hot.add(coffee)
    hot.add(cocoa)
    
    tea.add(black)
    tea.add(green)
    tea.add(chai)
    
    cold.add(soda)
    cold.add(milk)
    
    soda.add(gingerAle)
    soda.add(bitterLemon)
    
    return tree
}

let tree = makeBeverageTree()
tree.forEachDepthFirst {
    print($0.value)
}
