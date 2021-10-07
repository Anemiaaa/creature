import Foundation

let creaturesArray: [Creature]

for 0 ..< 10 {
    creaturesArray.append(Creature.random())
}

creaturesArray.forEach { creature in
    creature.action()
}

creaturesArray.forEach { creature in
    creature.sayHello()
}
