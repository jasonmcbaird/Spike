//
//  Initiatable.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

protocol Activatable: class {
    
    var activated: Bool { get set }
    
    func activate()
    func deactivate()
    
    var activationClosures: [String: () -> ()] { get set }
    
}

extension Activatable {
    
    func activate() {
        activated = true
        for closure in activationClosures.values {
            closure()
        }
    }
    
    func deactivate() {
        guard((self as? Damageable)?.health ?? 1 > 0) else {
            return
        }
        activated = false
    }
    
}
