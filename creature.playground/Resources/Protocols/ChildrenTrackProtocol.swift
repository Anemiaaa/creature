//
//  ChildrenTrackProtocol.swift
//  creatureProject
//
//  Created by IOS on 05.10.2021.
//

import Foundation

protocol ChildrenBirthDelegate: AnyClass {
    func didChildBirthed(creature: Creature, partner: Creature?, child: Creature) 
}
