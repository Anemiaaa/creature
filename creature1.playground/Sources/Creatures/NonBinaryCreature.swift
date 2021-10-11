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
    public weak var partner: Creature?

    public let sex = Sex.nonBinary
    
    // MARK: -
    // MARK: Overrided
    
    override public static func random() -> NonBinary {
        random(namePrefix: "Random nonBinary", initialization: NonBinary.init)
    }
    
    override public func action() {
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
