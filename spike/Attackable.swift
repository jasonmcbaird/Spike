//
//  Attackable.swift
//  spike
//
//  Created by Jason Baird on 11/17/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

protocol Attackable {
    
    func takeDamage(amount: Int, type: DamageType)
    var attributes: [String: Int] { get }
    
}
