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
        
    static func createAction(name: String, amount: Int) -> Action {
        return BasicAttack(min: amount, max: amount)
    }
    
    static func createAction(name: String, amount: Int, nextAmount: Int) -> Action {
        return BasicAttack(min: amount, max: nextAmount)
    }
}

class BasicAttack: Attack {
    let min: Int
    let max: Int
    
    init(min: Int, max: Int) {
        self.min = min
        self.max = max
    }
    
    func execute(source: Sourceable, targets: [Targetable]) {
        for target in targets {
            if((target as? Missable)?.checkHit(mod: ((source as? Accurate)?.accuracy) ?? 0) ?? true) {
                let amount = Randomizer.rollRange(min, max)
                (target as? Damageable)?.takeDamage(amount: amount)
                
                
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
