//
//  FemaleCreature.swift
//  creatureProject
//
//  Created by IOS on 05.10.2021.
//

import Foundation

class FemaleCreature: Creature {
    
    // MARK: -
    // MARK: Variables
    
    public let name: String
    public let weight: Float
    public let age: Int
    public let sex = Sex.female
    
    var children: [Creature] = []
    
    weak var partner: Creature?
    weak var delegate: ChildrenBirthDelegate?
    
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
        let child = Creature.random()
        
        self.partner = Creature.random()
        self.delegate?.didChildBirthed(creature: self, partner: self.partner, child: child)
    }
}
