//
//  Randomizer.swift
//  spike
//
//  Created by Jason Baird on 10/30/16.
//  Copyright © 2016 NorthForge. All rights reserved.
//

import Foundation
import GameplayKit

class Randomizer {
    
    static var dice: [Int: GKRandomDistribution] = [:]
    static var ranges: [RandomRange: GKRandomDistribution] = [:]
    
    static func rollDie(_ sides: Int) -> Int {
        if(dice[sides] == nil) {
            let random = GKRandomDistribution(forDieWithSideCount: sides)
            dice.updateValue(random, forKey: sides)
        }
        return dice[sides]!.nextInt()
    }
    
    static func rollRange(_ min: Int, _ max: Int) -> Int {
        let range = RandomRange(min, max)
        if(ranges[range] == nil) {
            let random = GKRandomDistribution(lowestValue: min, highestValue: max)
            ranges.updateValue(random, forKey: range)
        }
        return ranges[range]!.nextInt()
    }
}

struct RandomRange: Hashable {
    
    let i: Int
    let j: Int
    
    init(_ i: Int, _ j: Int) {
        self.i = i
        self.j = j
    }
    
    var hashValue: Int {
        return i.hashValue ^ j.hashValue
    }
    
    public static func ==(lhs: RandomRange, rhs: RandomRange) -> Bool {
        return lhs.i == rhs.i && lhs.j == rhs.j
    }
}
