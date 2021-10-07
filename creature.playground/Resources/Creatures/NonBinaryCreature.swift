//
//  NonBinaryCreature.swift
//  creatureProject
//
//  Created by IOS on 05.10.2021.
//

import Foundation

class NonBinary: Creature {
    
    // MARK: -
    // MARK: Variables
    
    weak var delegate: ChildrenBirthDelegate?
    weak var partner: Creature?
    
    public let name: String
    public let weight: Float
    public let age: Int
    public let sex = Sex.nonBinary
    
    var children: [Creature] = []

    // MARK: -
    // MARK: Initialization
    
    init(name: String, weight: Float, age: Int) {
        self.name = name
        self.weight = weight
        self.age = age
        
        self.sayHello()
    }
    
    // MARK: -
    // MARK: Public
    
    /// Realization of the Creature protocol function
    public func action() {
        let doChild = Bool.random()
        
        if !doChild {
            self.fight()
        }
        else {
            let child = Creature.random()
            
            self.partner = Creature.random()
            self.delegate?.didChildBirthed(creature: self, partner: self.partner, child: child)
        }
    }
    
    // MARK: -
    // MARK: Private

    private func fight() {
        print("WAAAAR!!!")
    }
}
