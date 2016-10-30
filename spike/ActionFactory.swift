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
    
    func createAction(name: String, amount: Int) -> Action {
        return StaticAttack(amount: amount)
    }
    
    func createAction(name: String, amount: Int, nextAmount: Int) -> Action {
        return Attack(min: amount, max: nextAmount)
    }
    
}

class StaticAttack: Action {
    
    private let amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    func execute(source: Sourceable, targets: [Targetable]) {
        for target in targets {
            (target as? Damageable)?.takeDamage(amount: amount, type: DamageType.physical)
        }
    }
    
}

class Attack: Action {
    
    private let min: Int
    private let max: Int
    private var random: GKRandomDistribution?
    
    init(min: Int, max: Int) {
        self.min = min
        self.max = max
    }
    
    func getRandom() -> GKRandomDistribution {
        if(random == nil) {
            random = GKRandomDistribution.init(lowestValue: min, highestValue: max)
        }
        return random!
    }
    
    func execute(source: Sourceable, targets: [Targetable]) {
        for target in targets {
            (target as? Damageable)?.takeDamage(amount: getRandom().nextInt(), type: DamageType.physical)
        }
    }
    
}
