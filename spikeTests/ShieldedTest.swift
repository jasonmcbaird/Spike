//
//  ShieldedTest.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class ShieldedTest: XCTestCase {
    
    func testTakeDamage() {
        
        let shielded = MockShielded()
        
        shielded.takeDamage(amount: 5)
        
        XCTAssertEqual(shielded.shield, 5)
        XCTAssertEqual(shielded.health, 5)
        
        shielded.takeDamage(amount: 7)
        
        XCTAssertEqual(shielded.shield, 0)
        XCTAssertEqual(shielded.health, 3)
        
        shielded.takeDamage(amount: 20)
        
        XCTAssertEqual(shielded.shield, 0)
        XCTAssertEqual(shielded.health, 0)
    }
    
    func testActivate() {
        
        let shielded = MockShielded()
        
        shielded.takeDamage(amount: 7)
        
        shielded.activate()
        
        XCTAssertEqual(shielded.shield, 3)
        
        shielded.activate()
        
        XCTAssertEqual(shielded.shield, 3)
        
        shielded.activate()
        
        XCTAssertEqual(shielded.shield, 8)
        
        shielded.activate()
        
        XCTAssertEqual(shielded.shield, 10)
    }
    
    func testPlasma() {
        
        let shielded = MockShielded()
        
        shielded.takeDamage(amount: 1)
        
        shielded.takeDamage(amount: 6, type: DamageType.plasma)
        
        XCTAssertEqual(shielded.shield, 0)
        XCTAssertEqual(shielded.health, 4)
    }
    
}
