//
//  AbilityTest.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class AbilityTest: XCTestCase {
    
    func testExecute() {
        let cost = MockCost()
        let action = MockAction()
        let ability = Ability(costs: [cost], actions: [action])
        
        let unit = MockFightable()
        
        ability.execute(source: unit, targets: [unit])
        
        XCTAssertEqual(cost.payCount, 1)
        XCTAssertEqual(action.executeCount, 1)
        
        cost.canPay = false
        
        ability.execute(source: unit, targets: [unit])
        
        XCTAssertEqual(cost.payCount, 1)
        XCTAssertEqual(action.executeCount, 1)
    }
    
}

class MockCost: Cost {
    
    var payCount = 0
    var canPay = true
    
    func pay(source: Sourceable) {
        payCount += 1
    }
    
    func canPay(source: Sourceable) -> Bool {
        return canPay
    }
    
}
