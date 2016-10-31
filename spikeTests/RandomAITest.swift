//
//  RandomCommandableTest.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class RandomAITest: XCTestCase {
    
    var ai = MockRandomAI()
    
    func testActivate() {
        let targets = [MockFightable(), MockFightable(), MockFightable()]
        ai.targets = targets
        
        ai.activate()
        XCTAssertTrue(ai.activated)
        
        for _ in 1...50 {
            ai.activate()
            ai.deactivate()
        }
        
        for target in targets {
            XCTAssertGreaterThan(target.damage, 0)
        }
        
        XCTAssertGreaterThan(ai.mockExecuteCount, 0)
    }
    
}
