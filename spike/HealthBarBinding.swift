//
//  HealthBarBinding.swift
//  spike
//
//  Created by dev1 on 11/4/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import UIKit

class HealthBarBinding {
    
    var progressBar: UIProgressView
    var damageable: Damageable
    
    init(progressBar: UIProgressView, damageable: Damageable) {
        self.progressBar = progressBar
        self.damageable = damageable
    }
    
    private func getUpdateClosure() -> (Int, DamageType) -> (Int) {
        
        return {amount, type in
            self.progressBar.progress = Float(self.damageable.health / self.damageable.maxHealth)
            return amount
        }
        
    }
    
}
