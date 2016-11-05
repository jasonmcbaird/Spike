//
//  Damageable.swift
//  spike
//
//  Created by dev1 on 10/24/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

protocol Damageable: class {
    
    func takeDamage(amount: Int, type: DamageType)
    
    var health: Int { get set }
    var maxHealth: Int { get set }
    var damageClosures: [String: (Int, DamageType) -> (Int)] { get set }
    
}

extension Damageable {
    
    func takeDamage(amount: Int) {
        takeDamage(amount: amount, type: DamageType.physical)
    }
    
    func takeDamage(amount: Int, type: DamageType) {
        var result = amount
        for key in damageClosures.keys {
            if(!key.contains("After:")) {
                result = damageClosures[key]!(result, type)
            }
        }
        health -= result
        if(health <= 0) {
            health = 0
            (self as? Activatable)?.activated = true
        }
        for key in damageClosures.keys {
            if(key.contains("After:")) {
                result = damageClosures[key]!(result, type)
            }
        }
    }
}
