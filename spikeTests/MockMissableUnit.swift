//
//  MockMissableUnit.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class MockMissableFightable: Fightable, Missable {
    
    var health: Int {
        get {
            return 0
        } set {
            damage -= newValue
        }
    }
    var damage = 0
    var missChance: Int = 20
    var missCount = 0
    
    func getAbilities() -> [Ability] {
        return []
    }
    
}
