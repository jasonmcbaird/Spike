//
//  InventoryTest.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class InventoryTest: XCTestCase {
    
    func testGetActions() {
        let inventory = Inventory()
        let useable = MockUseable()
        let creature = MockCreature()
        
        inventory.items.append(MockItem())
        inventory.items.append(useable)
        inventory.getActions()[0].execute(source: creature, targets: [creature])
        
        XCTAssertEqual((useable.actions[0] as! MockAction).executeCount, 1)
    }
}
