//
//  WeaponCombatTest.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class WeaponCombatTest: XCTestCase {
    
    var jace: Marine!
    var cody: Marine!
    
    override func setUp() {
        super.setUp()
        jace = Marine(maxHealth: 10)
        jace.inventory.items.append(WeaponFactory().createWeapon(name: "Assault Rifle"))
        cody = Marine(maxHealth: 10)
    }
    
    func testCombat() {
        jace.getActions()[0].execute(source: jace, targets: [cody])
        
        XCTAssertGreaterThanOrEqual(cody.health, 6)
        XCTAssertLessThanOrEqual(cody.health, 7)
        
        jace.getActions()[0].execute(source: jace, targets: [cody])
        
        XCTAssertGreaterThanOrEqual(cody.health, 2)
        XCTAssertLessThanOrEqual(cody.health, 4)
        
        jace.getActions()[0].execute(source: jace, targets: [cody])
        
        XCTAssertGreaterThanOrEqual(cody.health, 0)
        XCTAssertLessThanOrEqual(cody.health, 1)
        
        jace.getActions()[0].execute(source: jace, targets: [cody])
        
        XCTAssertEqual(cody.health, 0)
    }
    
}
