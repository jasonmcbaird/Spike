//
//  MockAction.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class MockAction: Action {
    
    var executeCount = 0
    
    func execute(source: Sourceable, targets: [Targetable]) {
        executeCount += 1
    }
}
