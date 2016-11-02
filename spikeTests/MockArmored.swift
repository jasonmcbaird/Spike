//
//  MockArmored.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class MockArmored: Armored {
    
    var health: Int = 5
    var armorAmount: Int = 0
    var damageClosures: [String : (Int, DamageType) -> (Int)] = [:]
    
    init() {
        armor = 2
    }
    
}
