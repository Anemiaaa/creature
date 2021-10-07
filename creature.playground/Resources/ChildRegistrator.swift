
class ChildRegistrator: ChildrenBirthDelegate {
    let female = FemaleCreature(name: "f1", weight: 43243, age: 231)
    
    female.delegate = self
    
    func didChildBirthed(creature: Creature, partner: Creature?, child: Creature)  {
        creature.children.append(child)
        partner?.children.append(child)
    }
}
