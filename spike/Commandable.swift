//
//  Commandable.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

protocol Commandable: class, Activatable, Sourceable {
    
    func chooseAbility() -> Ability
    func chooseTarget(possibleTargets: [Targetable]) -> Targetable?
    var targets: [Targetable] { get set }
    
}

extension Commandable {
    
    func activate() {
        appendAbilityClosure()
        activated = true
        for closure in activationClosures.values {
            closure()
        }
    }
    
    private func appendAbilityClosure() {
        if(activationClosures["Ability"] == nil) {
            activationClosures.updateValue({
                let target = self.chooseTarget(possibleTargets: self.targets)
                if(target != nil) {
                    self.chooseAbility().execute(source: self, targets: [target!])
                }
                }, forKey: "Ability")
        }
    }
}
