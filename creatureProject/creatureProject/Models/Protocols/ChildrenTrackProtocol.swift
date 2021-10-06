//
//  ChildrenTrackProtocol.swift
//  creatureProject
//
//  Created by IOS on 05.10.2021.
//

import Foundation

protocol ChildrenTrackProtocol {
    
    func printChild(_ creature: Creature)
    
    func addChild(to creature: Creature, _ child: Creature)
}

extension ChildrenTrackProtocol {
    
    /// Prints a Creature class object
    /// - Parameter creature: Creature class object
    func printChild(_ creature: Creature) {
        print("name: \(creature.name)\nweight: \(creature.weight)\nage: \(creature.age)\nsex: \(creature.sex)")
    }
    
    /// Adds a Creature class object to the children array of the given Creature object
    ///  - Parameter child: Creature class object which is added to object in creature param
    ///  - Parameter creature: Creature class object to which is added object in child param
    func addChild(to creature: Creature, _ child: Creature) {
        creature.addChild(child)
    }
}
