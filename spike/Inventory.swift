//
//  Inventory.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class Inventory {
    
    var items: [Item] = []
    
    func getActions() -> [Action] {
        var result: [Action] = []
        for item in items {
            result.append(contentsOf: (item as? Useable)?.actions ?? [])
        }
        return result
    }
    
}
