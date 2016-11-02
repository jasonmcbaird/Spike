//
//  MockFightable.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class MockFightable: Fightable, Nameable {
    
    var name = "Jim"
    var damageClosures: [String : (Int, DamageType) -> (Int)] = [:]
    
    var health: Int {
        get {
            return 0
        } set {
            damage -= newValue
        }
    }
    
    var damage = 0
    
    func getAbilities() -> [Ability] {
        return []
    }
}
