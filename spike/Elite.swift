//
//  Elite.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class Elite: Organic, Armable, RandomAI, Shielded, Nameable, Accurate {
    
    var name: String
    var maxHealth: Int = 20
    var missChance: Int = 35
    var maxShield: Int = 10
    var shieldRechargeDelay: Int = 3
    let inventory: Inventory = Inventory()
    var accuracy = 5
    
    var health: Int
    var shield: Int
    var activated = false
    var targets: [Targetable] = []
    var activationClosures: [String: () -> ()] = [:]
    var shieldRechargeCounter: Int = 0
    
    required init(name: String = "Voro Nar") {
        self.name = name
        self.health = maxHealth
        self.shield = maxShield
    }
    
}
