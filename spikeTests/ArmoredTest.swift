//
//  ArmoredTest.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class ArmoredTest: XCTestCase {
    
    func testTakeDamage() {
        let armored = MockArmored()
        
        armored.takeDamage(amount: 5)
        
        XCTAssertEqual(armored.health, 2)
    }
    
}
