//
//  MockActivatable.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class MockActivatable: Activatable {
    
    var turnCount = 0
    var activated = false
    var activationClosures: [String: () -> ()] = [:]
    
    init() {
        activationClosures.updateValue({
            self.turnCount += 1
        }, forKey: "Turn")
    }
}
