//
//  Spartan.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class Spartan: Organic, Armable, RandomAI, Shielded, Nameable, Accurate {
    
    var name: String
    var maxHealth: Int = 20
    var missChance: Int = 40
    var maxShield: Int = 15
    var shieldRechargeDelay: Int = 2
    let inventory: Inventory = Inventory()
    var accuracy = 25
    
    var health: Int
    var shield: Int
    var activated = false
    var targets: [Targetable] = []
    var activationClosures: [String: () -> ()] = [:]
    var shieldRechargeCounter: Int = 0
    
    required init(name: String = "John") {
        self.name = name
        self.health = maxHealth
        self.shield = maxShield
    }
    
}
