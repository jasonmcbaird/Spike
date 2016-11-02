//
//  BasicCombatSim.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import XCTest

class BasicCombatSim: XCTestCase {
    
    var humans: Team!
    var covenant: Team!
    var combat: Combat!
    
    override func setUp() {
        Logger.priorityThreshold = 0
    }
    
    func testBasicCombat() {
        var humanVictories = 0
        var covieVictories = 0
        
        for _ in 1...50 {
            Logger.log("========New fight========")
            setupNewCombat()
            combat.startCombat()
            if(combat.teams[0].isAlive()) {
                humanVictories += 1
            }
            if(combat.teams[1].isAlive()) {
                covieVictories += 1
            }
        }
        
        print("Human victories: \(humanVictories)")
        print("Covie victories: \(covieVictories)")
        
        XCTAssertGreaterThan(humanVictories, 3)
        XCTAssertGreaterThan(covieVictories, 3)
    }
    
    func testSpartanCombat() {
        var humanVictories = 0
        var covieVictories = 0
        
        for _ in 1...50 {
            Logger.log("========New fight========")
            setupNewSpartanCombat()
            combat.startCombat()
            if(combat.teams[0].isAlive()) {
                humanVictories += 1
            }
            if(combat.teams[1].isAlive()) {
                covieVictories += 1
            }
        }
        
        print("Human victories: \(humanVictories)")
        print("Covie victories: \(covieVictories)")
        
        XCTAssertGreaterThan(humanVictories, 3)
        XCTAssertGreaterThan(covieVictories, 3)
    }
    
    func setupNewCombat() {
        let jace = Marine(name: "Jace")
        let cody = Marine(name: "Cody")
        
        let yayap = Grunt(name: "Yayap")
        let dadab = Grunt(name: "Dadab")
        let flim = Grunt(name: "Flim")
        
        humans = Team(activatables: [jace, cody])
        covenant = Team(activatables: [yayap, dadab, flim])
        
        combat = Combat(teams: [humans, covenant])
        equip()
        
        combat.startTurnClosures.append(refreshTargets)
    }
    
    func setupNewSpartanCombat() {
        let chief = Spartan(name: "John")
        
        let bam = Grunt(name: "Bam")
        let sip = Grunt(name: "Sip")
        
        let voroNar = Elite(name: "Voro Nar")
        
        humans = Team(activatables: [chief])
        covenant = Team(activatables: [bam, sip, voroNar])
        
        combat = Combat(teams: [humans, covenant])
        equip()
        
        combat.startTurnClosures.append(refreshTargets)
    }
    
    func equip() {
        for human in humans.activatables {
            if(human is Spartan) {
                (human as! Armable).inventory.items.append(WeaponFactory().createWeapon(name: "Sniper Rifle"))
            } else {
                (human as! Armable).inventory.items.append(WeaponFactory().createWeapon(name: "Assault Rifle"))
            }
        }
        for alien in covenant.activatables {
            if(alien is Elite) {
                (alien as! Armable).inventory.items.append(WeaponFactory().createWeapon(name: "Plasma Rifle"))
            } else {
                (alien as! Armable).inventory.items.append(WeaponFactory().createWeapon(name: "Plasma Pistol"))
            }
        }
    }
    
    func refreshTargets() {
        for human in humans.activatables {
            (human as! Commandable).targets = []
            for target in covenant.activatables {
                if((target as! Damageable).health > 0) {
                    (human as! Commandable).targets.append(target as! Targetable)
                }
            }
        }
        
        for alien in covenant.activatables {
            (alien as! Commandable).targets = []
            for target in humans.activatables {
                if((target as! Damageable).health > 0) {
                    (alien as! Commandable).targets.append(target as! Targetable)
                }
            }
        }
    }
    
    override func tearDown() {
        Logger.priorityThreshold = 1
    }
    
}
