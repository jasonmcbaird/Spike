//
//  MockDamageable.swift
//  spike
//
//  Created by dev1 on 10/24/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class MockDamageable: Damageable {
    
    var health: Int = 30
    var damageClosures: [String : (Int, DamageType) -> (Int)] = [:]
    
}
