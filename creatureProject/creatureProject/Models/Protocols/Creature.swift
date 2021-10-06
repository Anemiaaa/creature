//
//  Creature.swift
//  creatureProject
//
//  Created by IOS on 05.10.2021.
//

import Foundation

enum Sex {
    case male, female, nonBinary
}

protocol Creature: AnyObject {
    
    var name: String { get }
    var weight: Float { get }
    var age: Int { get }
    var sex: Sex { get }
    var children: [Creature] { get set }
    
    func action()
    
    func sayHello()
    
    func addChild(_ child: Creature)
}

extension Creature {
    /// Prints a phrase to the console, then recursively calls itself on each object of the children array
    func sayHello() {
        print("Hello! I'm " + self.name)
        
        self.children.forEach({
            $0.sayHello()
        })
    }
    
    ///  Adds a Creature class object to the children array
    /// - Parameter child: Creature class object
    func addChild(_ child: Creature) {
        self.children.append(child)
    }
}

