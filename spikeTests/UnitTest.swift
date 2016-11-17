//
//  UnitTest.swift
//  spike
//
//  Created by Jason Baird on 11/17/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class UnitTest: XCTestCase {
    
    func testTakeDamage() {
        let testObject = Unit(name: "Cody", health: 20)
        
        testObject.takeDamage(3)
        
        XCTAssertEqual(testObject.attributes["health"], 17)
    }
}
