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
    
    func createTeams(filename: String) -> [String: Team] {
        
        let path = Bundle.main.url(forResource: filename, withExtension: "json")
        let data = try? Data(contentsOf: path!)
        
        return createTeams(jsonData: data!)
    }
    
    func createTeams(jsonData: Data) -> [String: Team] {
        var result: [String: Team] = [:]
        let teamObjects = try? JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
        for teamName in teamObjects!.keys {
            let team = Team(activatables: [])
            let teamJSON = teamObjects![teamName] as! [String: Any]
            for unitName in teamJSON.keys {
                let unitJSON = teamJSON[unitName] as! [String: Any]
                var unit: Activatable
                if(unitJSON.keys.contains("weapon")) {
                    unit = unitFactory.createArmedUnit(type: unitJSON["type"] as! String, name: unitName, weapon: unitJSON["weapon"] as! String)
                } else {
                    unit = unitFactory.createUnit(type: unitJSON["type"] as! String, name: unitName)
                }
                team.append(unit)
            }
            result.updateValue(team, forKey: teamName)
        }
        return result
    }
    
}
