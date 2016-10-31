//
//  AmmoCost.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class AmmoCost: Cost {
    
    var weapon: Reloadable
    
    init(weapon: Reloadable) {
        self.weapon = weapon
    }
    
    func canPay(source: Sourceable) -> Bool {
        return weapon.ammo > 0
    }
    
    func pay(source: Sourceable) {
        weapon.ammo -= 1
    }
}
