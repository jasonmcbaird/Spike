//
//  ReloadableTest.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class ReloadableTest: XCTestCase {
    
    func testGetActions() {
        let weapon = MockReloadable()
        let unit = MockFightable()
        
        weapon.abilities[0].execute(source: unit, targets: [unit])
        weapon.abilities[0].execute(source: unit, targets: [unit])
        weapon.abilities[0].execute(source: unit, targets: [unit])
        
        let threeShotDamage = unit.damage
        
        XCTAssertGreaterThan(threeShotDamage, 0)
        XCTAssertEqual(weapon.ammo, 0)

        weapon.abilities[0].execute(source: unit, targets: [unit])
        
        XCTAssertEqual(unit.damage, threeShotDamage)
        XCTAssertEqual(weapon.ammo, 3)
    }
}
