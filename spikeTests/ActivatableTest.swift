//
//  ActivatableTest.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class ActivatableTest: XCTestCase {
    
    var activatable: MockActivatable!
    
    override func setUp() {
        super.setUp()
        activatable = MockActivatable()
    }
    
    func testActivate() {
        activatable.activate()
        XCTAssertTrue(activatable.activated)
    }
    
    func testDeactivate() {
        activatable.activated = true
        activatable.deactivate()
        XCTAssertFalse(activatable.activated)
    }
    
}
