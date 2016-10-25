//
//  Cost.swift
//  spike
//
//  Created by dev1 on 10/24/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation

protocol Cost {
    
    func canPay(source: Sourceable) -> Bool
    func pay(source: Sourceable)
    
}
