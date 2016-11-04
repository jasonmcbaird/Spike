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
        let unit = MockFightable()
        
        inventory.append(MockItem())
        inventory.append(useable)
        inventory.getAbilities()[0].execute(source: unit, targets: [unit])
        
        XCTAssertEqual((useable.abilities[0].actions[0] as! MockAction).executeCount, 1)
    }
}
