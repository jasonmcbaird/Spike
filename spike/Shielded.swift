//
//  Shielded.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

protocol Shielded: Damageable, Activatable {
    
    var maxShield: Int { get }
    var shield: Int { get set }
    var shieldRechargeDelay: Int { get }
    var shieldRechargeCounter: Int { get set } // Init as -1
    
}

extension Shielded {
    
    func rechargeShield() {
        shield += (maxShield / 2)
        if(shield > maxShield) {
            shield = maxShield
        }
    }
    
    func takeDamage(amount: Int, type: DamageType) {
        appendShieldClosure()
        shield -= amount
        shieldRechargeCounter = shieldRechargeDelay
        if(shield < 0) {
            health += shield
            shield = 0
            if(health <= 0) {
                health = 0
                self.activated = true
            }
        }
    }
    
    private func appendShieldClosure() {
        if(activationClosures["Shield"] == nil) {
            activationClosures.updateValue({
                if(self.shieldRechargeCounter == 0) {
                    self.rechargeShield()
                    Logger.log("\((self as! Nameable).name) recharging shield to \(self.shield)")
                } else {
                    self.shieldRechargeCounter -= 1
                }
                }, forKey: "Shield")
        }
    }
    
}
