//
//  MockCommandable.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

final class MockCommandable: Commandable {
    
    var activated: Bool = false
    var targets: [Targetable] = []
    var activationClosures: [String: () -> ()] = [:]
    
    func getAbilities() -> [Ability] {
        return [Ability(action: MockAttack())]
    }
    
    func chooseTarget(possibleTargets: [Targetable]) -> Targetable? {
        return possibleTargets[0]
    }
    
    func chooseAbility() -> Ability {
        return getAbilities()[0]
    }
}
