import Foundation

class ChildRegistrator: ChildrenBirthDelegate {
    public func didChildBirthed(creature: Creature, partner: Creature?, child: Creature)  {
        creature.children.append(child)
        partner?.children.append(child)
        print("child was born!!!")
    }
}


var creaturesArray: [Creature] = []

let zags = ChildRegistrator()

for _ in 1 ... 10 {
    if var randomCreature = FemaleCreature.random(male: false, female: true, nonBinary: true) as? ChildBirthing {
        randomCreature.delegate = zags
        creaturesArray.append(randomCreature as! Creature)
    }
    creaturesArray.append(FemaleCreature.random(male: true, female: false, nonBinary: false))
}


creaturesArray.forEach { creature in
    creature.action()
}

creaturesArray.forEach { $0.sayHello() }
