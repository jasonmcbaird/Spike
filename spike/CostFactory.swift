//
//  CostFactory.swift
//  spike
//
//  Created by dev1 on 10/24/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class CostFactory {
    
    func createCost(name: String) -> Cost {
        return StaminaCost(amount: 3)
    }
}

class StaminaCost: Cost {
    
    private let amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    func canPay(source: Sourceable) -> Bool {
        return (source as? StaminaUser)?.canPayStamina(amount: amount) ?? false
    }
    
    func pay(source: Sourceable) {
        (source as? StaminaUser)?.payStamina(amount: amount)
    }
}
