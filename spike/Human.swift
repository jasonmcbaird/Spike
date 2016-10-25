//
//  Character.swift
//  spike
//
//  Created by dev1 on 10/24/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class Human: Creature {

    var maxHealth: Int
    var health: Int
    
    init(maxHealth: Int) {
        self.maxHealth = maxHealth
        self.health = maxHealth
    }
    
}
