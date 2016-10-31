//
//  RandomizerTest.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class RandomizerTest: XCTestCase {
    
    func testDice() {
        
        let _ = Randomizer.rollDie(3)
        let die = Randomizer.dice[3]
        let _ = Randomizer.rollDie(3)
        XCTAssertEqual(die, Randomizer.dice[3])
        
        let _ = Randomizer.rollRange(1, 3)
        let range = Randomizer.ranges[RandomRange(1, 3)]
        let _ = Randomizer.rollRange(1, 3)
        XCTAssertEqual(range, Randomizer.ranges[RandomRange(1, 3)])
    }
    
}
