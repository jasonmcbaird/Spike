//
//  BasicCombatTest.swift
//  spike
//
//  Created by dev1 on 10/24/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import XCTest

class BasicCombatTest: XCTestCase {
    
    var jace: Creature!
    var cody: Creature!
    
    override func setUp() {
        super.setUp()
        jace = Warrior(maxHealth: 30, stamina: 6)
        
        cody = Human(maxHealth: 25)
    }
    
    func testCombat() {
        let attack = ActionFactory().createAction(name: "Attack")
        attack.execute(source: jace, targets: [cody])
        
        XCTAssertEqual(cody.health, 22)
        
        let card = Card()
        card.actions.append(attack)
        card.costs.append(CostFactory().createCost(name: "Stamina"))
        
        XCTAssert(card.play(source: jace, targets: [cody]))
        XCTAssertEqual(cody.health, 19)
        
        XCTAssert(card.play(source: jace, targets: [cody]))
        XCTAssertEqual(cody.health, 16)
        
        XCTAssertFalse(card.play(source: jace, targets: [cody]))
        XCTAssertEqual(cody.health, 16)
    }
    
}
