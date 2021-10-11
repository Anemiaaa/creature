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
    
    public weak var partner: Creature?
    public weak var delegate: ChildrenBirthDelegate?
    
    public let sex = Sex.female
    
    // MARK: -
    // MARK: Overrided
    
    public override static func random() -> FemaleCreature {
        random(namePrefix: "Random Female", initialization: FemaleCreature.init)
    }
    
    override public func action() {
        let child = Creature.random()
        
        self.partner = Creature.random()
        self.delegate?.didChildBirthed(creature: self, partner: self.partner, child: child)
    }
}
