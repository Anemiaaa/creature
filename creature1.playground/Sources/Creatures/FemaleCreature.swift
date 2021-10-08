//
//  FemaleCreature.swift
//  creatureProject
//
//  Created by IOS on 05.10.2021.
//

import Foundation

public class FemaleCreature: Creature, ChildBirthing {

    // MARK: -
    // MARK: Variables
    
    public let name: String
    public let weight: Float
    public let age: Int
    public let sex = Sex.female

    public var children: [Creature] = []
    
    weak var partner: Creature?
    public weak var delegate: ChildrenBirthDelegate?
    
    // MARK: -
    // MARK: Initialization

    init(name: String, weight: Float, age: Int) {
        self.name = name
        self.weight = weight
        self.age = age
    }
    
    // MARK: -
    // MARK: Static
    
    public static func person() -> FemaleCreature {
        random(namePrefix: "Random Female", initialization: FemaleCreature.init)
    }
    
    // MARK: -
    // MARK: Public
    
    /// Realization of the Creature protocol function
    public func action() {
        let child = FemaleCreature.random()
        
        self.partner = FemaleCreature.random()
        self.delegate?.didChildBirthed(creature: self, partner: self.partner, child: child)
    }
}
