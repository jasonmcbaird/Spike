//
//  Combat.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class Combat {
    
    var teams: [Team]
    var startTurnClosures: [() -> ()] = []
    
    private var maxTeamSize: Int {
        get {
            var result = 0
            for team in teams {
                if(team.activatables.count > result) {
                    result = team.activatables.count
                }
            }
            return result
        }
    }
    
    private var survivingTeamCount: Int {
        get {
            var result = 0
            for team in teams {
                if(team.isAlive()) {
                    result += 1
                }
            }
            return result
        }
    }
    
    init(teams: [Team]) {
        self.teams = teams
    }
    
    func startCombat() {
        while(survivingTeamCount > 1) {
            startRound()
            endRound()
        }
    }
    
    func startRound() {
        Logger.log("========New round========")
        while(canStillActivate()) {
            startTurn()
        }
    }
    
    func startTurn() {
        for team in teams {
            for closure in startTurnClosures {
                closure()
            }
            activateNext(team: team)
        }
    }
    
    func activateNext(team: Team) {
        for activatable in team.activatables {
            if(!activatable.activated) {
                activatable.activate()
                return
            }
        }
    }
    
    func endRound() {
        for team in teams {
            for activatable in team.activatables {
                activatable.deactivate()
            }
        }
    }
    
    private func canStillActivate() -> Bool {
        for team in teams {
            for activatable in team.activatables {
                if(!activatable.activated) {
                    return true
                }
            }
        }
        return false
    }
}
