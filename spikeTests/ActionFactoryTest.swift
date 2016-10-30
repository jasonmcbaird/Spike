//
//  ActionFactoryTest.swift
//  spike
//
//  Created by dev1 on 10/24/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import XCTest

class ActionFactoryTest: XCTestCase {
    
    var factory: ActionFactory!
    
    override func setUp() {
        super.setUp()
        factory = ActionFactory()
    }
    
    func testAttack() {
        let action = factory.createAction(name: "Static Attack", amount: 3)
        let creature = MockCreature()
        action.execute(source: creature, targets: [creature])
        XCTAssertEqual(creature.damage, 3)
    }
    
    func testVariableAttack() {
        let action = factory.createAction(name: "Attack", amount: 3, nextAmount: 4)
        let sourceAndTarget = MockCreature()
        
        for _ in 1...100 {
            action.execute(source: sourceAndTarget, targets: [sourceAndTarget])
        }
        XCTAssertLessThan(sourceAndTarget.damage, 400)
        XCTAssertGreaterThan(sourceAndTarget.damage, 300)
    }
    
}
