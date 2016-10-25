//
//  CostFactoryTest.swift
//  spike
//
//  Created by dev1 on 10/24/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import XCTest

class CostFactoryTest: XCTestCase {
    
    var factory: CostFactory!
    
    override func setUp() {
        super.setUp()
        factory = CostFactory()
    }
    
    func testStamina() {
        let cost = factory.createCost(name: "Stamina")
        let source = Source()
        XCTAssert(cost.canPay(source: source))
        cost.pay(source: source)
        XCTAssertEqual(source.executionCount, 1)
    }
    
}

class Source: Sourceable, StaminaUser {
    
    var stamina = 5
    
    var executionCount = 0
    
    func canPayStamina(amount: Int) -> Bool {
        return true
    }
    
    func payStamina(amount: Int) {
        executionCount += 1
    }
}
