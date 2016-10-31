//
//  MockArmable.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class MockArmable: Armable {
    
    let inventory: Inventory = MockInventory()
    
}

class MockInventory: Inventory {
    
    private let ability = Ability(action: MockAction())
    
    override func getAbilities() -> [Ability] {
        return [ability]
    }
    
}
