//
//  Team.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class Team {
    
    var activatables: [Activatable]
    
    init(activatables: [Activatable]) {
        self.activatables = activatables
    }
    
    func isAlive() -> Bool {
        for activatable in activatables {
            if(!activatable.activated) {
                return true
            }
        }
        return false
    }
}
