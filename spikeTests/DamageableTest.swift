//
//  HealthManagerTest.swift
//  spike
//
//  Created by dev1 on 10/24/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class DamageableTest: XCTestCase {
    
    var damageable: MockDamageable!
    
    override func setUp() {
        super.setUp()
        damageable = MockDamageable()
    }
    
    func testTakeDamage() {
        damageable.takeDamage(amount: 5)
        XCTAssertEqual(damageable.health, 25)
    }
    
}
