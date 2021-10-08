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
    
    public let name: String
    public let weight: Float
    public let age: Int
    public let sex = Sex.male
    
    public var children: [Creature] = []
    
    // MARK: -
    // MARK: Initialization
    
    init(name: String, weight: Float, age: Int) {
        self.name = name
        self.weight = weight
        self.age = age
    }
    
    // MARK: -
    // MARK: Static
    
    public static func person() -> MaleCreature {
        random(namePrefix: "Random Male", initialization: MaleCreature.init)
    }
    
    // MARK: -
    // MARK: Public
    
    /// Realization of the Creature protocol function
    public func action() {
        self.fight()
    }
    
    // MARK: Private
    
    private func fight() {
        print("WAAAAR!!!")
    }
}
