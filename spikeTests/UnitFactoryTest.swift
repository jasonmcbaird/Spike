//
//  UnitFactoryTest.swift
//  spike
//
//  Created by dev1 on 11/4/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class UnitFactoryTest: XCTestCase {
    
    let factory = UnitFactory()
    
    func testUnitFactory() {
        let spartan: Spartan = factory.createUnit(type: "Spartan", name: "John") as! Spartan
        
        XCTAssertEqual(spartan.name, "John")
    }
    
    func testWithWeapon() {
        let spartan: Spartan = factory.createArmedUnit(type: "Spartan", name: "John", weapon: "Sniper Rifle") as! Spartan
        XCTAssert(spartan.inventory[0] is Weapon)
    }
    
}
