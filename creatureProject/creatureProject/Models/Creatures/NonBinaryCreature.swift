//
//  NonBinaryCreature.swift
//  creatureProject
//
//  Created by IOS on 05.10.2021.
//

import Foundation

class NonBinary: Creature, ChildrenTrackProtocol {
    
    // MARK: Variables
    
    var delegate: ChildrenTrackProtocol?
    
    public let name: String
    public let weight: Float
    public let age: Int
    public let sex = Sex.nonBinary
    
    internal var children: [Creature] = []
    
    private weak var anotherParent: Creature?
    
    // MARK: Initialization
    
    init(_ name: String, _ weight: Float, _ age: Int) {
        self.name = name
        self.weight = weight
        self.age = age
        
        sayHello()
    }
    
    // MARK: Public
    
    /// Realization of the Creature protocol function
    public func action() {
        let doChild = Bool.random()
        
        if !doChild {
            fight()
        }
        else {
            delegate = self
        
            delegate?.printChild(childBirth())
        }
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
    
    private func fight() {
        print("WAAAAR!!!")
    }
}
