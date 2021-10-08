import Foundation

class ChildRegistrator: ChildrenBirthDelegate {
    
    public func didChildBirthed(creature: Creature, partner: Creature?, child: Creature)  {
        creature.children.append(child)
        partner?.children.append(child)
        print("child was born!!!")
    }
}

let registrator = ChildRegistrator()

let childBirthings = (1 ... 20).map { _ -> Creature in
    let childBirthing = FemaleCreature.randomChildBirthing()
    childBirthing.delegate = registrator
    
    return childBirthing as! Creature
}

let males = (1...10).map { _ -> Creature in
    MaleCreature.person()
}

var creaturesArray: [Creature] = [childBirthings, males].flatMap { $0 }

creaturesArray.forEach { creature in
    creature.action()
}

creaturesArray.forEach { $0.sayHello() }
