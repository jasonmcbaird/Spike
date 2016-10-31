//
//  MockReloadable.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class MockReloadable: Reloadable {
    
    var ammo = 3
    var clipSize = 3
    var range = 1
    var minDamage = 1
    var maxDamage = 1
    lazy var attackAbilities: [Ability] = [self.getAttackAbility()]
    
    private func getAttackAbility() -> Ability {
        return Ability(cost: AmmoCost(weapon: self), action: MockAttack())
    }
    
}
