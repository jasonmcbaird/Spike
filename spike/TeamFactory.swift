//
//  TeamFactory.swift
//  spike
//
//  Created by dev1 on 11/4/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class TeamFactory {
    
    let unitFactory = UnitFactory()
    
    var teams: [String: Team]!
    
    init(filename: String = "MockTeams") {
        teams = createTeams(dictionary: JSON.parseJSON(filename: filename))
    }
    
    private func createTeams(dictionary: [String: Any]) -> [String: Team] {
        var result: [String: Team] = [:]
        for teamName in dictionary.keys {
            let team = parseTeam(name: teamName, dictionary: dictionary[teamName] as! [String: Any])
            result.updateValue(team, forKey: teamName)
        }
        return result
    }
    
    private func parseTeam(name: String, dictionary: [String: Any]) -> Team {
        let team = Team(activatables: [])
        for unitName in dictionary.keys {
            let unit = parseUnit(name: unitName, dictionary: dictionary[unitName] as! [String: Any])
            team.append(unit)
        }
        return team
    }
    
    private func parseUnit(name: String, dictionary: [String: Any]) -> Activatable {
        if(dictionary.keys.contains("weapon")) {
            return unitFactory.createArmedUnit(type: dictionary["type"] as! String, name: name, weapon: dictionary["weapon"] as! String)
        } else {
            return unitFactory.createUnit(type: dictionary["type"] as! String, name: name)
        }
    }
    
}
