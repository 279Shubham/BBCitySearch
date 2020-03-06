//
//  Trie.swift
//  BBCitySearch
//
//  Created by Shubham Sharma on 02/03/2020.
//  Copyright © 2020 Shubham Sharma. All rights reserved.
//

/*
 Trie datastructure for storing and retreiving the strings, this implementation supports search by prefix, can be easily extended to support search by completed word of suffix etc.
 
 For word search the complexity will be O(lengthOfWord). For finding all words with a particular prefix the complexity will be same as Tree DFS. For better performance,caching mechanisms can be used, if not caching then search can be used with a limit e.g- minimum 3 characters required to search.
 Also mixed characters makes the search slow, if only english alhpabets are present in the names then search traversal can be achievd in near constant time (length of word and 26).
 */
import Foundation

class TrieNode {
    public var children: [Character: TrieNode] = [:] //*1
    fileprivate var childerSortedArray:[Character] = []
    public var isFinal = false
    
    func createChildFor(_ character: Character) -> TrieNode {
        let lCharacter = Character(character.lowercased())
        
        let node = TrieNode()
        childerSortedArray.append(lCharacter)
        childerSortedArray = childerSortedArray.sorted()
        children[lCharacter] = node
        return node
    }
    func getOrCreateChildFor(_ character: Character) -> TrieNode {
        let lCharacter = Character(character.lowercased())
        if let child = children[lCharacter] {
            return child
        } else {
            return createChildFor(lCharacter)
        }
    }
}

class Trie {
    
    var root = TrieNode()
    
    func insert(_ word: String){
        let lWord = word.lowercased()
        insert(characters: Array(lWord))
    }
    
    private func insert(characters: [Character]) {
        var node = root
        for character in characters {
            node = node.getOrCreateChildFor(character)
        }
        node.isFinal = true //
    }
    
    ///private var allArray:[String] = []
    
    private func printAllWordsInTrie(root: TrieNode? , charArray:inout [Character], array:inout [String]) -> [String]
    {
        if let lRoot = root{
            
            if lRoot.isFinal{
                array.append(String(charArray))
            }
            
            if(lRoot.children.keys.count == 0){
                return array
            }
            
            for i in lRoot.childerSortedArray {
                let node = lRoot.children[i]
                charArray.append(i)
                _ = printAllWordsInTrie(root:node, charArray: &charArray,  array: &array)
                charArray = charArray.dropLast()
            }
        }
        return array
    }
    
    func query(searchString:String) -> [String]? {
        let characterArray = Array(searchString.lowercased())
        var node : TrieNode? = root
        for character in characterArray {
            node = node?.children[character]
        }
        let trie = Trie()
        trie.root = node ?? TrieNode()
        var charArray = characterArray
        var array:[String] = []
        return printAllWordsInTrie(root: trie.root, charArray: &charArray,array: &array )
    }
}
