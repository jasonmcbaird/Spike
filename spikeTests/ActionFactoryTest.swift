//
//  ActionFactoryTest.swift
//  spike
//
//  Created by dev1 on 10/24/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import XCTest

class ActionFactoryTest: XCTestCase {
    
    func testVariableAttack() {
        let action = ActionFactory.createAttack(minDamage: 3, maxDamage: 4)
        let unit = MockFightable()
        
        for _ in 1...100 {
            action.execute(source: unit, targets: [unit])
        }
        XCTAssertLessThan(unit.damage, 400)
        XCTAssertGreaterThan(unit.damage, 300)
    }
    
}
