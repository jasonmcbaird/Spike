//
//  StaminaUser.swift
//  spike
//
//  Created by dev1 on 10/24/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

protocol StaminaUser: class {
    
    var stamina: Int { get set }
    
    func canPayStamina(amount: Int) -> Bool
    
    func payStamina(amount: Int)
    
}

extension StaminaUser {
    
    func canPayStamina(amount: Int) -> Bool {
        return stamina >= amount
    }
    
    func payStamina(amount: Int) {
        stamina -= amount
    }
    
}
