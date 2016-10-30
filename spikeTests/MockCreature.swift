//
//  MockCreature.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class MockCreature: Creature {
    
    var health = 0
    
    var damage = 0
    
    func takeDamage(amount: Int, type: DamageType) {
        damage += amount
    }
    
    func getActions() -> [Action] {
        return []
    }
}
