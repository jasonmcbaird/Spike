//
//  Marine.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class Marine: Creature, Armable {
    
    var maxHealth: Int
    var health: Int
    let inventory: Inventory = Inventory()
    
    init(maxHealth: Int = 10) {
        self.maxHealth = maxHealth
        self.health = maxHealth
    }
    
}
