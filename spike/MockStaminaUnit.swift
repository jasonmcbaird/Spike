//
//  Warrior.swift
//  spike
//
//  Created by dev1 on 10/24/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class MockStaminaFightable: Fightable, StaminaUser {
    
    var maxHealth: Int
    var health: Int
    var stamina: Int
    var damageClosures: [String : (Int, DamageType) -> (Int)] = [:]
    
    init(maxHealth: Int, stamina: Int) {
        self.maxHealth = maxHealth
        self.health = maxHealth
        self.stamina = stamina
    }
    
    func getAbilities() -> [Ability] {
        return []
    }
    
}
