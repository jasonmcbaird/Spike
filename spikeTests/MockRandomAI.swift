//
//  MockRandomAI.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class MockRandomAI: RandomAI {
    
    var activated: Bool = false
    var targets: [Targetable] = []
    private var action = MockAction()
    var activationClosures: [String: () -> ()] = [:]
    
    var mockExecuteCount: Int {
        get {
            return action.executeCount
        }
    }
    
    func getAbilities() -> [Ability] {
        return [Ability(action: MockAttack()), Ability(action: action)]
    }
}
