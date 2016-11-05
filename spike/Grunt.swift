//
//  Grunt.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class Grunt: Organic, Armable, RandomAI, Nameable {
    
    var name: String
    var maxHealth: Int = 8
    var dodge: Int = 30
    let inventory: Inventory = Inventory()
    
    var health: Int
    var activated = false
    var targets: [Targetable] = []
    var activationClosures: [String: () -> ()] = [:]
    var damageClosures: [String : (Int, DamageType) -> (Int)] = [:]
    
    init(name: String = "Yayap") {
        self.name = name
        self.health = maxHealth
    }
    
}
