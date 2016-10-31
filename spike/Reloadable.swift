//
//  Reloadable.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

protocol Reloadable: Weapon {
    
    var clipSize: Int { get }
    var ammo: Int { get set }
    
}

extension Reloadable {
    
    var abilities: [Ability] {
        get {
            if(ammo > 0) {
                return attackAbilities
            } else {
                return [Ability(action: Reload(weapon: self))]
            }
        }
    }
}

class Reload: Action {
    
    var weapon: Reloadable
    
    init(weapon: Reloadable) {
        self.weapon = weapon
    }
    
    func execute(source: Sourceable, targets: [Targetable]) {
        weapon.ammo = weapon.clipSize
        Logger.log("\((source as! Nameable).name) reloads")
    }
}
