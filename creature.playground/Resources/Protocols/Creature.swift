//
//  Creature.swift
//  creatureProject
//
//  Created by IOS on 05.10.2021.
//

import Foundation

enum Sex {
    case male
    case female
    case nonBinary
}

protocol Creature: AnyClass {
    
    var name: String { get }
    var weight: Float { get }
    var age: Int { get }
    var sex: Sex { get }
    var children: [Creature] { get set }
    
    func action()
    
    func sayHello()
    
    static func random() -> Creature
}

extension Creature {
    func sayHello() {
        print("Hello! I'm " + self.name)
        
        self.children.forEach({
            $0.sayHello()
        })
    }
    	
    static func random() -> Creature {
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

