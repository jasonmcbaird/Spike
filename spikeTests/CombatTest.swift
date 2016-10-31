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
        red.activatables.removeAll()
        red.activatables.append(MockSuicidalActivatable(team: red))
        red.activatables.append(MockSuicidalActivatable(team: red))
        
        combat.startCombat()
        
        XCTAssertEqual(red.activatables.count, 0)
        XCTAssertEqual((blue.activatables[0] as! MockActivatable).turnCount, 4)
    }
    
    func testStartRound() {
        combat.startRound()
        
        for activatable in red.activatables as! [MockActivatable] {
            XCTAssertEqual(activatable.turnCount, 1)
            XCTAssertTrue(activatable.activated)
        }
    }
    
    func testStartTurn() {
        combat.startTurn()
        
        XCTAssertEqual((red.activatables[0] as! MockActivatable).turnCount, 1)
        XCTAssertEqual((blue.activatables[0] as! MockActivatable).turnCount, 1)

        XCTAssertTrue((red.activatables[0] as! MockActivatable).activated)
        XCTAssertTrue((blue.activatables[0] as! MockActivatable).activated)
    }
    
    func testEndRound() {
        let redOne = red.activatables[0] as! MockActivatable
        let blueThree = red.activatables[2] as! MockActivatable
        
        redOne.activated = true
        blueThree.activated = true
        
        combat.endRound()
        
        XCTAssertFalse(redOne.activated)
        XCTAssertFalse(blueThree.activated)
    }
    
    class MockSuicidalActivatable: MockActivatable {
        
        let team: Team
        
        init(team: Team) {
            self.team = team
            super.init()
            activationClosures.updateValue({
                if(self.turnCount >= 3) {
                    self.team.activatables = self.team.activatables.filter( {
                        $0 !== self
                    })
                }
            }, forKey: "Suicide")
        }
    }
    
}
