import UIKit

class TrieNode {
    var char: Character
    var isCompleteWord: Bool
    var parent: TrieNode?
    var children: [Character: TrieNode]
    init(char: Character, parent: TrieNode? = nil) {
        self.char = char
        self.parent = parent
        self.children = [:]
        self.isCompleteWord = false
    }
    func add(child: Character) {
        // how do we add a node, what are we doing here? why do we need this?
        // this is for a node, add node for
        // add a new child to the node's children
        guard children[child] == nil else { return }
        children[child] = TrieNode(char: child, parent: self)
    }
}
class Trie {
    private var root: TrieNode
    init() {
        self.root = TrieNode(char: "*")
    }
    private func getNode(_ word: String) -> TrieNode? {
        var currentNode = root
        for char in word {
            guard let childNode = currentNode.children[char] else { return nil}
            currentNode = childNode
        }
        return currentNode
    }
    func insert(_ word: String) {
        var currentNode = root
        for letter in word {
            if let childNode = currentNode.children[letter] {
                currentNode = childNode
            } else {
                currentNode.add(child: letter)
                guard let childNode = currentNode.children[letter] else {return}
                currentNode = childNode
            }
        }
        guard !currentNode.isCompleteWord else {return}
        currentNode.isCompleteWord = true
    }
    func search(_ word: String) -> Bool {
        guard let node = getNode(word) else {return false}
        return node.isCompleteWord
    }
    func startsWith(_ prefix: String) -> Bool {
        guard let _ = getNode(prefix) else { return false}
        return true
    }
}
