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
    var endTurnWait = 1
    
    private var maxTeamSize: Int {
        get {
            var result = 0
            for team in teams {
                if(team.count > result) {
                    result = team.count
                }
            }
            return result
        }
    }
    
    private var survivingTeamCount: Int {
        get {
            var result = 0
            for team in teams {
                if(team.isActive()) {
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
        DispatchQueue.init(label: "Combat").async {
            while(self.survivingTeamCount > 1) {
                self.startRound()
                self.endRound()
            }
        }
    }
    
    func startRound() {
        Logger.log("========New round========")
        sleep(UInt32(endTurnWait))
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
            sleep(UInt32(endTurnWait))
        }
    }
    
    func activateNext(team: Team) {
        for activatable in team {
            if(!activatable.activated) {
                activatable.activate()
                return
            }
        }
    }
    
    func endRound() {
        for team in teams {
            team.deactivate()
        }
    }
    
    private func canStillActivate() -> Bool {
        for team in teams {
            if(team.isActive()) {
                return true
            }
        }
        return false
    }
}
