//
//  Armable.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

protocol Armable: class, Sourceable {
    
    var inventory: Inventory { get }
    
}

extension Armable {
    
    func getAbilities() -> [Ability] {
        return inventory.getAbilities()
    }
    
}
