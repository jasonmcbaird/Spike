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
        let action = factory.createAction(name: "Attack")
        let sourceAndTarget = SourceAndTarget()
        action.execute(source: sourceAndTarget, targets: [sourceAndTarget])
        XCTAssertEqual(sourceAndTarget.executionCount, 1)
    }
    
}

class SourceAndTarget: Sourceable, Targetable, Damageable {
    
    var health = 0
    
    var executionCount = 0
    
    func takeDamage(amount: Int, type: DamageType) {
        executionCount += 1
    }
}
