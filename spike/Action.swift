//
//  Action.swift
//  spike
//
//  Created by dev1 on 10/24/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

protocol Action {
    
    func execute(source: Sourceable, targets: [Targetable])
    
}
