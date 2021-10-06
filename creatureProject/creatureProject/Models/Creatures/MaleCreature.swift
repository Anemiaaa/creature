//
//  MaleCreature.swift
//  creatureProject
//
//  Created by IOS on 05.10.2021.
//

import Foundation

class MaleCreature: Creature, ChildrenTrackProtocol {
    
    // MARK: Variables
    
    public let name: String
    public let weight: Float
    public let age: Int
    public let sex = Sex.male
    
    internal var children: [Creature] = []
    
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
        fight()
    }
    
    // MARK: Private
    
    private func fight() {
        print("WAAAAR!!!")
    }
}
