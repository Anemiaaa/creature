//
//  Helpers.swift
//  creatureProject
//
//  Created by IOS on 05.10.2021.
//

import Foundation

class Helper {
    /// Returns a randomly generetad instance of the Creature class
    /// - Returns: instance of the Creature class
    static func getRandomCreature() -> Creature {
        let name = "Random Creature " + String(Int.random(in: 1...100))
        let weight = Float.random(in: 1...100)
        let age = Int.random(in: 1...100)
        
        let indexSex = Int.random(in: 0 ..< 3)
        
        let child: Creature
        if indexSex == 0 {
            child = FemaleCreature(name, weight, age)
        }
        else if indexSex == 1 {
            child = MaleCreature(name, weight, age)
        }
        else {
            child = NonBinary(name, weight, age)
        }
        
        return child
    }
}
