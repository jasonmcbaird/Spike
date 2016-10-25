//
//  Card.swift
//  spike
//
//  Created by dev1 on 10/24/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class Card {
    
    var actions: [Action] = []
    var costs: [Cost] = []
    
    func play(source: Sourceable, targets: [Targetable]) -> Bool {
        for cost in costs {
            if(!cost.canPay(source: source)) {
                return false
            }
        }
        for cost in costs {
            cost.pay(source: source)
        }
        for action in actions {
            action.execute(source: source, targets: targets)
        }
        return true
    }
    
}
