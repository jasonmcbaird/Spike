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
    var shieldRechargeCounter: Int { get set }
    
}

extension Shielded {
    
    // TODO: Need to call appendClosures() before you take damage
    
    func rechargeShield() {
        shield += (maxShield / 2)
        if(shield > maxShield) {
            shield = maxShield
        }
    }
    
    private func appendClosures() {
        appendShieldDamageClosure()
        appendShieldRechargeClosure()
    }
    
    private func appendShieldDamageClosure() {
        if(damageClosures["Shield"] == nil) {
            damageClosures.updateValue({amount, type in
                var result = amount
                if(type == DamageType.plasma) {
                    result = result * 2
                }
                self.shield -= result
                self.shieldRechargeCounter = self.shieldRechargeDelay
                if(self.shield < 0) {
                    result = -self.shield
                    self.shield = 0
                    if(type == DamageType.plasma) {
                        result = result / 2
                    }
                    return result
                } else {
                    return 0
                }
            }, forKey: "Shield")
        }
    }
    
    private func appendShieldRechargeClosure() {
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
