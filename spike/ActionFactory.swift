//
//  ActionFactory.swift
//  spike
//
//  Created by dev1 on 10/24/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class ActionFactory {
    
    func createAction(name: String) -> Action {
        return Attack(amount: 3)
    }
    
}

class Attack: Action {
    
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
