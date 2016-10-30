//
//  Weapon.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

protocol Weapon: Useable {
    
    var range: Int { get }
    var minDamage: Int { get }
    var maxDamage: Int { get }
    
}
