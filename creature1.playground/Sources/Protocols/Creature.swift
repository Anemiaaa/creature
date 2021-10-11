//
//  Creature.swift
//  creatureProject
//
//  Created by IOS on 05.10.2021.
//

import Foundation

public enum Sex {
    
    case male
    case female
    case nonBinary
}

public class Creature {
    
    // MARK: -
    // MARK: Variables
    
    var name: String
    var weight: Float
    var age: Int
    var children: [Creature] = []
    
    // MARK: -
    // MARK: Initialization
    
    init(name: String, weight: Float, age: Int) {
        self.name = name
        self.weight = weight
        self.age = age
    }
    
    // MARK: -
    // MARK: Public
    
    public func action() {
        fatalError("override action function")
    }
    
    public func sayHello() {
        print("Hello! I'm " + self.name)
        
        self.children.forEach({
            $0.sayHello()
        })
    }
    
    public func add(child: Creature) {
        self.children.append(child)
    }
    
    public class func random() -> Creature {
        [FemaleCreature.random(), MaleCreature.random(), NonBinary.random()].randomElement()!
    }
    
    // MARK: -
    // MARK: Internal
    
    internal static func random<CreatureType: Creature>(
        namePrefix: String,
        initialization: (String, Float, Int) -> CreatureType
    )
        -> CreatureType
    {
        let numberForName = String(Int.random(in: 1...100))
        let weight = Float.random(in: 1...100)
        let age = Int.random(in: 1...100)
        
        return initialization(namePrefix + " " + numberForName, weight, age)
    }
}

public protocol ChildBirthing: AnyObject {
    
    var delegate: ChildrenBirthDelegate? { get set }
}
