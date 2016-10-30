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
    
    private let action = MockAction()
    
    override func getActions() -> [Action] {
        return [action]
    }
    
}
