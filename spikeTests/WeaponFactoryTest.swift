//
//  WeaponFactoryTest.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class WeaponFactoryTest: XCTestCase {
    
    var factory: WeaponFactory!
    
    override func setUp() {
        super.setUp()
        factory = WeaponFactory()
    }
    
    func testAssaultRifle() {
        let weapon = factory.createWeapon(name: "Assault Rifle")
        
        XCTAssert(weapon.actions[0] is Attack)
    }
    
}
