//
//  CombatTest.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class CombatTest: XCTestCase {
    
    var red: Team!
    var blue: Team!
    var combat: Combat!
    
    override func setUp() {
        super.setUp()
        red = Team(activatables: [MockActivatable(), MockActivatable(), MockActivatable()])
        blue = Team(activatables: [MockActivatable(), MockActivatable(), MockActivatable()])
        combat = Combat(teams: [red, blue])
    }
    
    func testStartCombat() {
        red = Team(activatables: [MockSuicidalActivatable(), MockSuicidalActivatable()])
        combat = Combat(teams: [red, blue])
        
        combat.startCombat()
        
        XCTAssertFalse(red.isActive())
        XCTAssertEqual((blue[0] as! MockActivatable).turnCount, 4)
    }
    
    func testStartRound() {
        combat.startRound()
        
        for activatable in red {
            let mock = activatable as! MockActivatable
            XCTAssertEqual(mock.turnCount, 1)
            XCTAssertTrue(mock.activated)
        }
    }
    
    func testStartTurn() {
        combat.startTurn()
        
        XCTAssertEqual((red[0] as! MockActivatable).turnCount, 1)
        XCTAssertEqual((blue[0] as! MockActivatable).turnCount, 1)

        XCTAssertTrue((red[0] as! MockActivatable).activated)
        XCTAssertTrue((blue[0] as! MockActivatable).activated)
    }
    
    func testEndRound() {
        let redOne = red[0] as! MockActivatable
        let blueThree = red[2] as! MockActivatable
        
        redOne.activated = true
        blueThree.activated = true
        
        combat.endRound()
        
        XCTAssertFalse(redOne.activated)
        XCTAssertFalse(blueThree.activated)
    }
    
    class MockSuicidalActivatable: MockActivatable {
        
        var dead = false
        private var privateActivated = false
        override var activated: Bool {
            get {
                return dead || privateActivated
            } set {
                privateActivated = newValue
            }
        }
        
        override init() {
            super.init()
            activationClosures.updateValue({
                if(self.turnCount >= 3) {
                    self.dead = true
                }
            }, forKey: "Suicide")
        }
    }
    
}
