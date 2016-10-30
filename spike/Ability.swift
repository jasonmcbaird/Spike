//
//  Ability.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class Ability {
    
    var actions: [Action] = []
    var costs: [Cost] = []
    
    init(costs: [Cost], actions: [Action]) {
        self.costs = costs
        self.actions = actions
    }
    
    func execute(source: Sourceable, targets: [Targetable]) {
        for cost in costs {
            guard(cost.canPay(source: source)) else {
                return
            }
        }
        for cost in costs {
            cost.pay(source: source)
        }
        for action in actions {
            action.execute(source: source, targets: targets)
        }
    }
    
}
