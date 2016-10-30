//
//  MarineTest.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class ArmableTest: XCTestCase {
    
    func testGetActions() {
        let armable = MockArmable()
        
        let creature = MockCreature()
        
        armable.getActions()[0].execute(source: creature, targets: [creature])
        
        XCTAssertEqual((armable.inventory.getActions()[0] as! MockAction).executeCount, 1)
    }
    
}
