//
//  Logger.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class Logger {
    
    static var priorityThreshold = 1
    
    static func log(_ string: String, _ priority: Int = 0) {
        if(priority >= priorityThreshold) {
            print(string)
        }
    }
    
}
