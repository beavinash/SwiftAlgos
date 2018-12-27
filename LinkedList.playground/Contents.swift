let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

print(node1)

var pushList = LinkedList<Int>()
pushList.push(1)
pushList.push(2)
pushList.push(3)

var appendList = LinkedList<Int>()
appendList.append(1)
appendList.append(2)
appendList.append(3)


var list = LinkedList<Int>()
list.push(3)
list.push(2)
list.push(1)

print("Before inserting: \(list)")
var middleNode = list.node(at: 1)!
for _ in 1...4 {
    middleNode = list.insert(-1, after: middleNode)
}
print("After inserting: \(list)")
