//
//  Inventory.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class Inventory: Sequence {
    
    private var items: [Item] = []
    
    func getAbilities() -> [Ability] {
        var result: [Ability] = []
        for item in items {
            result.append(contentsOf: (item as? Useable)?.abilities ?? [])
        }
        return result
    }
    
    func append(_ item: Item) {
        items.append(item)
    }
    
    func makeIterator() -> ItemIterator {
        return ItemIterator(array: items)
    }
    
    subscript(index: Int) -> Item {
        get {
            return items[index]
        }
    }
    
}

class ItemIterator: IteratorProtocol {
    var index = -1
    var array: [Item]
    
    init(array: [Item]) {
        self.array = array
    }
    
    func next() -> Item? {
        index += 1
        guard(index < array.count) else {
            return nil
        }
        return array[index]
    }
}
