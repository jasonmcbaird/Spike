//
//  AttackTest.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class AttackTest: XCTestCase {
    
    func testVariableAttack() {
        let attack = MockAttack()
        let unit = MockFightable()
        
        for _ in 1...50 {
            attack.execute(source: unit, targets: [unit])
        }
        XCTAssertLessThan(unit.damage, 200)
        XCTAssertGreaterThan(unit.damage, 150)
    }
    
    func testMiss() {
        let attack = MockAttack()
        let source = MockFightable()
        let missable = MockMissableFightable()
        
        for _ in 1...50 {
            attack.execute(source: source, targets: [missable])
        }
        XCTAssertLessThan(missable.damage, 170)
        XCTAssertGreaterThan(missable.damage, 50)
        
    }
    
}
