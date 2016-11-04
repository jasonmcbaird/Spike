//
//  MockArmored.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class MockArmored: Armored {

    var health = 5
    var maxHealth = 5
    var armor = 2
    var armorAmount: Int = 0
    var damageClosures: [String : (Int, DamageType) -> (Int)] = [:]
    
    init() {
        appendArmoredClosures()
    }
    
}
