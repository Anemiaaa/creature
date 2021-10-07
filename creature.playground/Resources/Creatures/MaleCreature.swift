//
//  MaleCreature.swift
//  creatureProject
//
//  Created by IOS on 05.10.2021.
//

import Foundation

class MaleCreature: Creature, ChildrenTrackProtocol {
    
    // MARK: -
    // MARK: Variables
    
    public let name: String
    public let weight: Float
    public let age: Int
    public let sex = Sex.male
    
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
        self.fight()
    }
    
    // MARK: Private
    
    private func fight() {
        print("WAAAAR!!!")
    }
}
