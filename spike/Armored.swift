//
//  Armored.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

protocol Armored: Damageable {
    
    var armor: Int { get set }
    
}

extension Armored {
    
    // TODO: Need to call appendArmorClosure() before you take damage
    
    private func appendArmorClosure() {
        if(damageClosures["Armor"] == nil) {
            damageClosures.updateValue({amount, type in
                if(amount > self.armor) {
                    return amount - self.armor
                } else {
                    return 0
                }
                }, forKey: "Armor")
        }
    }
    
}
