//
//  TeamTest.swift
//  spike
//
//  Created by dev1 on 11/4/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class TeamTest: XCTestCase {
    
    func testIsActive() {
        let team = Team(activatables: [MockActivatable(), MockActivatable()])
        
        XCTAssertTrue(team.isActive())
        
        for activatable in team {
            activatable.activated = true
        }
        
        XCTAssertFalse(team.isActive())
    }
    
}
