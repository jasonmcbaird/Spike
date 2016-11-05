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
    let factory = TeamFactory(filename: "MockTeams")
    
    init() {
        humans = factory.teams["North Forge"]
        aliens = factory.teams["Violet Squad"]
        for human in humans {
            let progressBar = UIProgressView()
            HealthBarBinding(progressBar: progressBar, damageable: human as! Damageable)
        }
    }
    
}
