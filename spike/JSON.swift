//
//  JSONParser.swift
//  spike
//
//  Created by Jason Baird on 11/5/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

class JSON {
    
    static func parseJSON(filename: String) -> [String: Any] {
        
        let path = Bundle.main.url(forResource: filename, withExtension: "json")
        let data = try? Data(contentsOf: path!)
        
        return try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
    }
    
}
