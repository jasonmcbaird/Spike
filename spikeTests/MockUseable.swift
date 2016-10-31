//
//  MockWeapon.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class MockUseable: Useable {
    
    var abilities: [Ability]
    
    init() {
        abilities = [Ability(action: MockAction())]
    }
    
}
