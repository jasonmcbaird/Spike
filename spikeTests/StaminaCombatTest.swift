//
//  BasicCombatTest.swift
//  spike
//
//  Created by dev1 on 10/24/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import XCTest

class StaminaCombatTest: XCTestCase {
    
    var jace: Creature!
    var cody: Creature!
    
    override func setUp() {
        super.setUp()
        jace = Warrior(maxHealth: 30, stamina: 6)
        
        cody = Marine(maxHealth: 25)
    }
    
    func testCombat() {
        let attack = ActionFactory().createAction(name: "Attack", amount: 3)
        attack.execute(source: jace, targets: [cody])
        
        XCTAssertEqual(cody.health, 22)
        
        let ability = Ability(costs: [CostFactory().createCost(name: "Stamina")], actions: [attack])
        
        ability.execute(source: jace, targets: [cody])
        XCTAssertEqual(cody.health, 19)
        
        ability.execute(source: jace, targets: [cody])
        XCTAssertEqual(cody.health, 16)
        
        ability.execute(source: jace, targets: [cody])
        XCTAssertEqual(cody.health, 16)
    }
    
}
