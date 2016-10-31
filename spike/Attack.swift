//
//  Attack.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import GameplayKit

protocol Attack: class, Action {
    
    var min: Int { get }
    var max: Int { get }
    
    func execute(source: Sourceable, targets: [Targetable])
}

extension Attack {
    
    func execute(source: Sourceable, targets: [Targetable]) {
        for target in targets {
            if((target as? Missable)?.checkHit() ?? true) {
                (target as? Damageable)?.takeDamage(amount: Randomizer.rollRange(min, max))
            }
        }
    }
}
