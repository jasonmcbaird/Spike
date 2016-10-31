//
//  Inventory.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class Inventory {
    
    var items: [Item] = []
    
    func getAbilities() -> [Ability] {
        var result: [Ability] = []
        for item in items {
            result.append(contentsOf: (item as? Useable)?.abilities ?? [])
        }
        return result
    }
    
}
