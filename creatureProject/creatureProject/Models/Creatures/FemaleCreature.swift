//
//  FemaleCreature.swift
//  creatureProject
//
//  Created by IOS on 05.10.2021.
//

import Foundation

class FemaleCreature: Creature, ChildrenTrackProtocol {
    
    // MARK: Variables
    
    public let name: String
    public let weight: Float
    public let age: Int
    public let sex = Sex.female
    
    internal var children: [Creature] = []
    
    private weak var anotherParent: Creature?
    
    var delegate: ChildrenTrackProtocol?
    
    // MARK: Initialization
    
    init(_ name: String, _ weight: Float, _ age: Int) {
        self.name = name
        self.weight = weight
        self.age = age
        
        sayHello()
    
        delegate = self
    }
    
    // MARK: Public
    
    /// Realization of the Creature protocol function
    public func action() {
        delegate?.printChild(childBirth())
    }
    
    /// Sets the variable anotherParent
    public func addParentForChildren(_ parent: Creature) {
        anotherParent = parent
    }
    
    // MARK: Private
    
    /// Generates a Creature class object and call the delegate functions
    /// - Returns: generated object of Creature class
    private func childBirth() -> Creature {
        let child = Helper.getRandomCreature()
        
        delegate?.addChild(to: self, child)
        
        if let anotherParent = anotherParent {
            delegate?.addChild(to: anotherParent, child)
        }
        
        return child
    }

}
