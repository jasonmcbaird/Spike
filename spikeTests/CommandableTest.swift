//
//  CommandableTest.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class CommandableTest: XCTestCase {
    
    var commandable: MockCommandable = MockCommandable()
    
    func testActivate() {
        let targets = [MockFightable(), MockFightable(), MockFightable()]
        commandable.targets = targets
        
        commandable.activate()
        XCTAssertTrue(commandable.activated)
        
        for _ in 1...50 {
            commandable.activate()
            commandable.deactivate()
        }
        
        XCTAssertGreaterThan(targets[0].damage, 30)
    }
}
