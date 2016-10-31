//
//  RandomCommandable.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

protocol RandomAI: Commandable {
    
}

extension RandomAI {
    
    func chooseTarget(possibleTargets: [Targetable]) -> Targetable? {
        if(possibleTargets.count == 0) {
            return nil
        }
        return possibleTargets[Randomizer.rollDie(possibleTargets.count) - 1]
    }
    
    func chooseAbility() -> Ability {
        let roll = Randomizer.rollDie(getAbilities().count) - 1
        return getAbilities()[roll]
    }
    
}
