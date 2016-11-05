//
//  WeaponFactory.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class WeaponFactory {
    
    var weaponDictionary: [String: Weapon]!
    
    init(filename: String = "MockWeapons") {
        weaponDictionary = createWeapons(dictionary: JSON.parseJSON(filename: "MockWeapons"))
    }
    
    func createWeapon(name: String) -> Weapon {
        return weaponDictionary[name]!
    }
    
    private func createWeapons(dictionary: [String: Any]) -> [String: Weapon] {
        var result: [String: Weapon] = [:]
        for weaponName in dictionary.keys {
            let weapon = parseWeapon(name: weaponName, dictionary: dictionary[weaponName] as! [String : Any])
            result.updateValue(weapon, forKey: weaponName)
        }
        return result
    }
    
    private func parseWeapon(name: String, dictionary: [String: Any]) -> Weapon {
        if(dictionary.keys.contains("clipSize")) {
            return ReloadableWeapon(range: dictionary["range"] as! Int, minDamage: dictionary["minDamage"] as! Int, maxDamage: dictionary["maxDamage"] as! Int, clipSize: dictionary["clipSize"] as! Int)
        } else {
            return BasicWeapon(range: dictionary["range"] as! Int, minDamage: dictionary["minDamage"] as! Int, maxDamage: dictionary["maxDamage"] as! Int)
        }
    }
}

class BasicWeapon: Weapon {
    let range: Int
    let minDamage: Int
    let maxDamage: Int
    let damageType: DamageType
    
    init(range: Int, minDamage: Int, maxDamage: Int, damageType: DamageType = DamageType.physical) {
        self.range = range
        self.minDamage = minDamage
        self.maxDamage = maxDamage
        self.damageType = damageType
    }
    
    lazy var attackAbilities: [Ability] = [self.getAttackAbility()]
    var abilities: [Ability] {
        get {
            return attackAbilities
        }
    }
    
    private func getAttackAbility() -> Ability {
        return Ability(costs: [], actions: [ActionFactory.createAttack(minDamage: minDamage, maxDamage: maxDamage, type: damageType)])
    }
}

class ReloadableWeapon: Reloadable {
    let range: Int
    let minDamage: Int
    let maxDamage: Int
    let clipSize: Int
    let damageType: DamageType
    var ammo: Int
    
    init(range: Int, minDamage: Int, maxDamage: Int, clipSize: Int, damageType: DamageType = DamageType.physical) {
        self.range = range
        self.minDamage = minDamage
        self.maxDamage = maxDamage
        self.clipSize = clipSize
        self.ammo = clipSize
        self.damageType = damageType
    }
    
    lazy var attackAbilities: [Ability] = [self.getAttackAbility()]
    
    private func getAttackAbility() -> Ability {
        return Ability(costs: [AmmoCost(weapon: self)], actions: [ActionFactory.createAttack(minDamage: minDamage, maxDamage: maxDamage, type: damageType)])
    }
}
