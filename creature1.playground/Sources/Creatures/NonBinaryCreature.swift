	//
//  NonBinaryCreature.swift
//  creatureProject
//
//  Created by IOS on 05.10.2021.
//

import Foundation

public class NonBinary: Creature, ChildBirthing {
    
    // MARK: -
    // MARK: Variables
    
    public weak var delegate: ChildrenBirthDelegate?
    weak var partner: Creature?
    
    public let name: String
    public let weight: Float
    public let age: Int
    public let sex = Sex.nonBinary

    public var children: [Creature] = []

    // MARK: -
    // MARK: Initialization
    
    init(name: String, weight: Float, age: Int) {
        self.name = name
        self.weight = weight
        self.age = age
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
            let child = FemaleCreature.random()
            
            self.partner = FemaleCreature.random()
            self.delegate?.didChildBirthed(creature: self, partner: self.partner, child: child)
        }
    }
    
    // MARK: -
    // MARK: Private

    private func fight() {
        print("WAAAAR!!!")
    }
}
