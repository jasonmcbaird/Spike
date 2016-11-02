//
//  MockShielded.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class MockShielded: Shielded, Nameable {
    
    var maxShield = 10
    var shield = 10
    var shieldRechargeDelay = 2
    var shieldRechargeCounter = 2
    var activationClosures: [String: () -> ()] = [:]
    var damageClosures: [String : (Int, DamageType) -> (Int)] = [:]
    var activated = false
    
    var health = 5
    
    var name = "Shielded"
    
}
