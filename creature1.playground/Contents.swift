import Foundation

class ChildRegistrator: ChildrenBirthDelegate {
    
    public func didChildBirthed(creature: Creature, partner: Creature?, child: Creature)  {
        creature.add(child: child)
        partner?.add(child: child)
        print("child was born!!!")
    }
}

let registrator = ChildRegistrator()

let childBirthings = (1 ... 20).map { _ -> Creature in
    let childBirthing = Bool.random() ? FemaleCreature.random() : NonBinary.random()
    (childBirthing as? ChildBirthing)?.delegate = registrator
    
    return childBirthing
}

let males = (1...10).map { _ in
    MaleCreature.random()
}

var creaturesArray: [Creature] = [childBirthings, males].flatMap { $0 }

creaturesArray.forEach { creature in
    creature.action()
}

creaturesArray.forEach { $0.sayHello() }
