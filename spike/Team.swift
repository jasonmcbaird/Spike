//
//  Team.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class Team: Sequence {
    private var activatables: [Activatable]
    
    init(activatables: [Activatable]) {
        self.activatables = activatables
    }
    
    func isActive() -> Bool {
        for activatable in self {
            if(!activatable.activated) {
                return true
            }
        }
        return false
    }
    
    var count: Int {
        get {
            return activatables.count
        }
    }
    
    func makeIterator() -> ActivatableIterator {
        return ActivatableIterator(array: activatables)
    }
    
    func append(_ activatable: Activatable) {
        activatables.append(activatable)
    }
    
    subscript(index: Int) -> Activatable {
        get {
            return activatables[index]
        }
    }
}

class ActivatableIterator: IteratorProtocol {
    var index = -1
    var array: [Activatable]
    
    init(array: [Activatable]) {
        self.array = array
    }
    
    func next() -> Activatable? {
        index += 1
        guard(index < array.count) else {
            return nil
        }
        return array[index]
    }
}
