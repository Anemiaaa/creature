//
//  MaleCreature.swift
//  creatureProject
//
//  Created by IOS on 05.10.2021.
//

import Foundation

public class MaleCreature: Creature {
    
    // MARK: -
    // MARK: Variables
    
    public let sex = Sex.male
    
    // MARK: -
    // MARK: Overrided
    
    override public static func random() -> MaleCreature {
        random(namePrefix: "Random Male", initialization: MaleCreature.init)
    }
    
    override public func action() {
        self.fight()
    }
    
    // MARK: -
    // MARK: Private
    
    private func fight() {
        print("WAAAAR!!!")
    }
}
