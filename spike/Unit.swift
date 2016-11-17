//
//  Unit.swift
//  spike
//
//  Created by Jason Baird on 11/17/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class Unit: Activatable, Attackable, Visualizable {

    
    var attributes: [String: Int] {
        get {
            var result = privateAttributes
            result["health"] = health
            return result
        }
    }
    private var privateAttributes: [String: Int] = [:]
    var name: String
    var activated: Bool = false
    private var health: Int
    private var maxHealth: Int
    
    var activationClosures: [String : () -> ()] = [:]
    
    init(name: String, health: Int) {
        self.name = name
        self.maxHealth = health
        self.health = maxHealth
    }
    
    func takeDamage(_ amount: Int) {
        takeDamage(amount: amount, type: DamageType.physical)
    }
    
    func takeDamage(amount: Int, type: DamageType) {
        health -= amount
    }
}
