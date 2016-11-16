//
//  SpartanCombatScene.swift
//  spike
//
//  Created by dev1 on 11/4/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import UIKit

class SpartanCombatScene {
    
    var humans: Team!
    var aliens: Team!
    let factory = TeamFactory()
    
    init() {
        var teams = factory.createTeams(filename: "MockTeams")
        humans = teams["North Forge"]
        aliens = teams["Violet Squad"]
    }
    
}
