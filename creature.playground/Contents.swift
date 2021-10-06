import Foundation

enum Sex {
    case male, female, nonBinary
}

protocol ChildrenTrackProtocol {
    func printChild(_ creature: Creature)
    
    func addChild(to creature: Creature, _ child: Creature)
}

extension ChildrenTrackProtocol {
    func printChild(_ creature: Creature) {
        print("name: \(creature.name)\nweight: \(creature.weight)\nage: \(creature.age)\nsex: \(creature.sex)")
    }
    
    func addChild(to creature: Creature, _ child: Creature) {
        creature.addChild(child)
    }
}

protocol Creature: AnyObject {
    var name: String { get }
    var weight: Float { get }
    var age: Int { get }
    var sex: Sex { get }
    
    var children: [Creature] { get set }
    
    func action()
    func sayHello()
    func addChild(_ child: Creature)
}

extension Creature {
    func sayHello() {
        print("Hello! I'm " + self.name)
        
        self.children.forEach({
            $0.sayHello()
        })
    }
    
    func addChild(_ child: Creature) {
        self.children.append(child)
    }
}

class Helper {
    static func getRandomCreature() -> Creature {
        let name = "Random Creature " + String(Int.random(in: 1...100))
        let weight = Float.random(in: 1...100)
        let age = Int.random(in: 1...100)
        
        let indexSex = Int.random(in: 0 ..< 3)
        
        let child: Creature
        if indexSex == 0 {
            child = FemaleCreature(name, weight, age)
        } else if indexSex == 1 {
            child = MaleCreature(name, weight, age)
        } else {
            child = NonBinary(name, weight, age)
        }
        
        return child
    }
}

class FemaleCreature: Creature, ChildrenTrackProtocol {
    public let name: String
    public let weight: Float
    public let age: Int
    public let sex = Sex.female
    
    internal var children: [Creature] = []
    
    private weak var anotherParent: Creature?
    
    var delegate: ChildrenTrackProtocol?
    
    init(_ name: String, _ weight: Float, _ age: Int) {
        self.name = name
        self.weight = weight
        self.age = age
        
        sayHello()
    
        delegate = self
    }
    
    public func action() {
        delegate?.printChild(childBirth())
    }
    
    public func addParentForChildren(_ parent: Creature) {
        anotherParent = parent
    }
    
    private func childBirth() -> Creature {
        let child = Helper.getRandomCreature()
        
        delegate?.addChild(to: self, child)
        
        if let anotherParent = anotherParent {
            delegate?.addChild(to: anotherParent, child)
        }
        
        return child
    }
}

class MaleCreature: Creature, ChildrenTrackProtocol {
    public let name: String
    public let weight: Float
    public let age: Int
    public let sex = Sex.male
    
    internal var children: [Creature] = []
    
    init(_ name: String, _ weight: Float, _ age: Int) {
        self.name = name
        self.weight = weight
        self.age = age
        
        sayHello()
    }
    
    public func action() {
        fight()
    }
    
    private func fight() {
        print("WAAAAR!!!")
    }
}

class NonBinary: Creature, ChildrenTrackProtocol {
    public let name: String
    public let weight: Float
    public let age: Int
    public let sex = Sex.nonBinary
    
    internal var children: [Creature] = []
    
    var delegate: ChildrenTrackProtocol?
    
    private weak var anotherParent: Creature?
    
    init(_ name: String, _ weight: Float, _ age: Int) {
        self.name = name
        self.weight = weight
        self.age = age
        
        sayHello()
    }
    
    public func action() {
        let doChild = Bool.random()
        
        if !doChild {
            fight()
        } else {
            delegate = self
        
            delegate?.printChild(childBirth())
        }
    }
    
    public func getSex() -> Sex {
        return Sex.nonBinary
    }
    
    public func addParentForChildren(_ parent: Creature) {
        anotherParent = parent
    }
    
    private func childBirth() -> Creature {
        let child = Helper.getRandomCreature()
        
        delegate?.addChild(to: self, child)
        
        if let anotherParent = anotherParent {
            delegate?.addChild(to: anotherParent, child)
        }
        
        return child
    }
    
    private func fight() {
        print("WAAAAR!!!")
    }
}

let s1 = MaleCreature("s1", Float.random(in: 1...100), Int.random(in: 1...100))
let s2 = FemaleCreature("s2", Float.random(in: 1...100), Int.random(in: 1...100))
let s3 = NonBinary("s3", Float.random(in: 1...100), Int.random(in: 1...100))
let s4: Creature

s2.addParentForChildren(s1)
s2.action()

s1.sayHello()

