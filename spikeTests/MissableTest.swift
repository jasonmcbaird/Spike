//
//  MissableTest.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class MissableTest: XCTestCase {
    
    func testCheckHit() {
        let missable = MockMissable()
        
        var hitCount = 0
        
        for _ in 1...100 {
            if(missable.checkHit()) {
                hitCount += 1
            }
        }
        
        XCTAssertGreaterThanOrEqual(hitCount, 5)
        XCTAssertLessThanOrEqual(hitCount, 95)
    }
    
}
