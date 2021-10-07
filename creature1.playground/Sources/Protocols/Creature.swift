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
    
    static func random(male: Bool, female: Bool, nonBinary: Bool) -> Creature 
}

extension Creature {
    public func sayHello() {
        print("Hello! I'm " + self.name)
        
        self.children.forEach({
            $0.sayHello()
        })
    }
    	
    public static func random(male: Bool = true, female: Bool = true, nonBinary: Bool = true) -> Creature {
        let numberForName = String(Int.random(in: 1...100))
        let weight = Float.random(in: 1...100)
        let age = Int.random(in: 1...100)
        var neededGenders: [Sex] = []
        
        if female == true { neededGenders.append(Sex.female) }
        if male == true { neededGenders.append(Sex.male) }
        if nonBinary == true { neededGenders.append(Sex.nonBinary) }
        
        let sex = neededGenders[Int.random(in: 0 ..< neededGenders.count)]
        
        if sex == Sex.female {
            return FemaleCreature(name: "Random female " + numberForName, weight: weight, age: age)
        }
        else if sex == Sex.male {
            return MaleCreature(name: "Random male " + numberForName, weight: weight, age: age)
        }
        else {
            return NonBinary(name: "Random nonBinary " + numberForName, weight: weight, age: age)
        }
    }
}

public protocol ChildBirthing {
    var delegate: ChildrenBirthDelegate? { get set }
}
