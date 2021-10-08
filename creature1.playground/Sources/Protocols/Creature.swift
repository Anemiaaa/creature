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

public protocol Creature: AnyObject {
    
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
    public func sayHello() {
        print("Hello! I'm " + self.name)
        
        self.children.forEach({
            $0.sayHello()
        })
    }
    
    public static func random() -> Creature {
        [FemaleCreature.person(), MaleCreature.person(), NonBinary.person()].randomElement()!
    }
    
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
    
    static func randomChildBirthing() -> ChildBirthing
}

extension ChildBirthing {

    static public func randomChildBirthing() -> ChildBirthing {
        [FemaleCreature.person(), NonBinary.person()].randomElement()!
    }
//
//    public func register(registrator: ChildrenBirthDelegate) -> Self {
//        self.delegate = registrator
//        return self
//    }
}
