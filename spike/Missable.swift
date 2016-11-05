//
//  Missable.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import GameplayKit

protocol Missable: Targetable {
    
    var dodge: Int { get }
    
    func checkHit(mod: Int) -> Bool
    
}

extension Missable {
    
    func checkHit(mod: Int = 0) -> Bool {
        return Randomizer.rollDie(100) + mod >= dodge
    }
    
}
