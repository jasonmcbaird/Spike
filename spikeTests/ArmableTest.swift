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
        
        let unit = MockFightable()
        
        armable.getAbilities()[0].execute(source: unit, targets: [unit])
        
        XCTAssertEqual((armable.inventory.getAbilities()[0].actions[0] as! MockAction).executeCount, 1)
    }
    
}
