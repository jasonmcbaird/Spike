//
//  ActionFactory.swift
//  spike
//
//  Created by dev1 on 10/24/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import GameplayKit

class ActionFactory {
    
    static func createAttack(minDamage: Int, maxDamage: Int, type: DamageType = DamageType.physical) -> Attack {
        return BasicAttack(min: minDamage, max: maxDamage, type: type)
    }
}

class BasicAttack: Attack {
    let min: Int
    let max: Int
    var type: DamageType = DamageType.physical
    
    init(min: Int, max: Int, type: DamageType = DamageType.physical) {
        self.min = min
        self.max = max
        self.type = type
    }
    
    func execute(source: Sourceable, targets: [Targetable]) {
        for target in targets {
            if((target as? Missable)?.checkHit(mod: ((source as? Accurate)?.accuracy) ?? 0) ?? true) {
                let amount = Randomizer.rollRange(min, max)
                (target as? Damageable)?.takeDamage(amount: amount, type: type)
                
                
                if(target is Damageable) {
                    Logger.log("\((source as! Nameable).name) deals \(amount) to \((target as! Nameable).name)!")
                    if((target as! Damageable).health == 0) {
                        Logger.log("\((target as! Nameable).name) is dead!")
                    }
                }
            } else {
                Logger.log("\((source as! Nameable).name) misses \((target as! Nameable).name)")
            }
        }
    }
}
