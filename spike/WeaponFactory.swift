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
        return AssaultRifle()
    }
    
}

class AssaultRifle: Weapon {
    
    let range: Int = 3
    let minDamage: Int = 3
    let maxDamage: Int = 4
    private var privateActions: [Action]?
    
    var actions: [Action] {
        get {
            if(privateActions == nil) {
                privateActions = [ActionFactory().createAction(name: "Attack", amount: minDamage, nextAmount: maxDamage)]
            }
            return privateActions!
        }
    }
    
}
