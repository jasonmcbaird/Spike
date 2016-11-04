//
//  UnitFactory.swift
//  spike
//
//  Created by dev1 on 11/4/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class UnitFactory {
    
    lazy var weaponFactory = WeaponFactory()
    
    func createUnit(type: String, name: String) -> Activatable {
        switch(type) {
        case "Spartan":
            return Spartan(name: name)
        case "Marine":
            return Marine(name: name)
        case "Grunt":
            return Grunt(name: name)
        case "Elite":
            return Elite(name: name)
        default:
            return Marine(name: name)
        }
    }
    
    func createArmedUnit(type: String, name: String, weapon: String) -> Activatable {
        var unit: Activatable
        switch(type) {
        case "Spartan":
            unit = Spartan(name: name)
        case "Marine":
            unit = Marine(name: name)
        case "Grunt":
            unit = Grunt(name: name)
        case "Elite":
            unit = Elite(name: name)
        default:
            unit = Marine(name: name)
        }
        (unit as! Armable).inventory.append(weaponFactory.createWeapon(name: weapon))
        return unit
    }
    
}
