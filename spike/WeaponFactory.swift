//
//  WeaponFactory.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class WeaponFactory {
    
    func createWeapon(name: String) -> Weapon {
        switch(name) {
        case "Assault Rifle":
            return AssaultRifle()
        case "Sniper Rifle":
            return SniperRifle()
        case "Plasma Pistol":
            return PlasmaPistol()
        case "Plasma Rifle":
            return PlasmaRifle()
        default:
            return AssaultRifle()
        }
    }
}

class AssaultRifle: Reloadable {
    
    let range: Int = 3
    let minDamage: Int = 3
    let maxDamage: Int = 4
    let clipSize = 4
    var ammo = 4
    lazy var attackAbilities: [Ability] = [self.getAttackAbility()]
    
    private func getAttackAbility() -> Ability {
        return Ability(costs: [AmmoCost(weapon: self)], actions: [ActionFactory.createAction(name: "Attack", amount: minDamage, nextAmount: maxDamage)])
    }
    
}

class SniperRifle: Reloadable {
    
    let range: Int = 16
    let minDamage: Int = 6
    let maxDamage: Int = 10
    let clipSize = 4
    var ammo = 4
    lazy var attackAbilities: [Ability] = [self.getAttackAbility()]
    
    private func getAttackAbility() -> Ability {
        return Ability(costs: [AmmoCost(weapon: self)], actions: [ActionFactory.createAction(name: "Attack", amount: minDamage, nextAmount: maxDamage)])
    }
}

class PlasmaPistol: Weapon {
    
    let range: Int = 4
    let minDamage: Int = 1
    let maxDamage: Int = 2
    var attackAbilities: [Ability]
    
    init() {
        attackAbilities = [Ability(costs: [], actions: [ActionFactory.createAction(name: "Attack", amount: minDamage, nextAmount: maxDamage)])]
    }
    
    var abilities: [Ability] {
        get {
            return attackAbilities
        }
    }
}

class PlasmaRifle: Weapon {
    
    let range: Int = 3
    let minDamage: Int = 3
    let maxDamage: Int = 4
    var attackAbilities: [Ability]
    
    init() {
        attackAbilities = [Ability(costs: [], actions: [ActionFactory.createAction(name: "Attack", amount: minDamage, nextAmount: maxDamage)])]
    }
    
    var abilities: [Ability] {
        get {
            return attackAbilities
        }
    }
}
