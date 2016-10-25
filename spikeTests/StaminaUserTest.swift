//
//  StaminaUserTest.swift
//  spike
//
//  Created by dev1 on 10/24/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class StaminaUserTest: XCTestCase {
    
    var user: StaminaUser!
    
    override func setUp() {
        super.setUp()
        user = MockStaminaUser()
    }
    
    func testCanPayStamina() {
        XCTAssert(user.canPayStamina(amount: 3))
        XCTAssertFalse(user.canPayStamina(amount: 6))
        user.stamina = 0
        XCTAssertFalse(user.canPayStamina(amount: 1))
    }
    
    func testPayStamina() {
        user.payStamina(amount: 5)
        XCTAssertEqual(user.stamina, 0)
    }
    
}
