import Foundation

public protocol ChildrenBirthDelegate: AnyObject {
    
    func didChildBirthed(creature: Creature, partner: Creature?, child: Creature)
}
