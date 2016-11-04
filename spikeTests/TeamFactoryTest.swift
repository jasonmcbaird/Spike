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
        let factory = TeamFactory()
        
        let teams = factory.createTeams(filename: "MockTeams")
        
        XCTAssertEqual(teams.keys.first, "North Forge")
        XCTAssertEqual((teams.values.first![0] as! Nameable).name, "Cody")
        XCTAssert(teams.values.first![0] is Marine)
        XCTAssertEqual(teams.count, 2)
        XCTAssertEqual(teams.values.first!.count, 6)
    }
    
}
