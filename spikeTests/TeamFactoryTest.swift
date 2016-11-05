//
//  TeamFactoryTest.swift
//  spike
//
//  Created by dev1 on 11/4/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class TeamFactoryTest: XCTestCase {
    
    func testCreateTeams() {
        let factory = TeamFactory(filename: "Teams")
        
        XCTAssertEqual(factory.teams.keys.first, "North Forge")
        XCTAssertEqual((factory.teams.values.first![0] as! Nameable).name, "Cody")
        XCTAssert(factory.teams.values.first![0] is Marine)
        XCTAssertEqual(factory.teams.count, 2)
        XCTAssertEqual(factory.teams.values.first!.count, 6)
    }
    
}
