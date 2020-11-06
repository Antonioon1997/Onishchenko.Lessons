import Foundation

enum Brand{
    case Mesr, Mazda, BMW
}
enum BodyType{
    case sedan, crossover, truck
}
enum Color{
    case black, white, silver, red
}
enum Trunck {
    case cistern, jambo, none
}
protocol CarPropreties: AnyObject {
    var brandName: Brand { get }
    var modelName: String { get }
    var bodyType: BodyType { get }
    var color: Color { get }
    var windowsIsOpened: Bool { get set }
    var engineIsStarted: Bool { get set }
    var mileage: Int { get set }
}
extension CarPropreties {
    func openWidnows (state : Bool) {
        if state == true {
            windowsIsOpened == true
            print ("Windows now opened")
        }
        else {
            windowsIsOpened == false
            print ("Windows now closed")
        }
    }
}
extension   CarPropreties {
    func startEngine (state: Bool) {
        if state == true {
            engineIsStarted == state
            print ("Engine now started")
        }
        else {
            engineIsStarted == state
            print ("Engine now stoped")
        }
    }
}
class PassengerCar: CarPropreties {
    var brandName: Brand
    
    var modelName: String
    
    var bodyType: BodyType
    
    var color: Color
    
    var windowsIsOpened: Bool
    
    var engineIsStarted: Bool
    
    var mileage: Int
    
    var maxSpeed: Int
    
    var isSportcar: Bool {
        if maxSpeed >= 200{
            return true
        }
        else{
            return false
        }
    }
    var hatchIsOpened: Bool
    
    
    init (brandName: Brand, modelName: String, bodyType: BodyType, color: Color, maxSpeed: Int,  windowsIsOpened: Bool, engineIsStarted: Bool, mileage: Int, hatchIsOpened: Bool){
        self.brandName = brandName
        self.modelName = modelName
        self.bodyType = bodyType
        self.color = color
        self.maxSpeed = maxSpeed
        self.windowsIsOpened = windowsIsOpened
        self.engineIsStarted = engineIsStarted
        self.mileage = mileage
        self.hatchIsOpened = hatchIsOpened
    }

}
var car1 = PassengerCar(brandName: .BMW, modelName: "x6", bodyType: .crossover, color: .silver, maxSpeed: 200, windowsIsOpened: false, engineIsStarted: false, mileage: 0, hatchIsOpened: false)
car1.startEngine(state: true)
car1.openWidnows(state: true)
car1.isSportcar
car1.engineIsStarted
car1.windowsIsOpened

extension PassengerCar {
    func openHatch (state: Bool) {
        if state == true {
            hatchIsOpened == true
            print ("Hatch now opened")
        }
        else {
            hatchIsOpened == false
            print ("Hatch now closed")
        }
    }
}
class TrunkCar: CarPropreties {
    var brandName: Brand
    
    var modelName: String
    
    var bodyType: BodyType = .truck
    
    var color: Color
    
    var windowsIsOpened: Bool
    
    var engineIsStarted: Bool
    
    var mileage: Int
    
    var trunck: Trunck
    
    var trunckValue: Int {
        switch trunck {
        case .cistern:
            return 80_000;
        case .jambo:
            return 100_000
        default:
            return 0
        }
    }
        var trunkFilness: Int = 0
    
    init (brandName: Brand, modelName: String, color: Color, windowsIsOpened: Bool, engineIsStarted: Bool, mileage: Int, trunck: Trunck){
        self.brandName = brandName
        self.modelName = modelName
        self.color = color
        self.windowsIsOpened = windowsIsOpened
        self.engineIsStarted = engineIsStarted
        self.mileage = mileage
        self.trunck = trunck
    }
}
extension TrunkCar {
    func loadTrunck (value: Int){
        if value + trunkFilness <= trunckValue {
            trunkFilness += value
            print ("You load \(value) liters in trunk, left \(trunckValue - trunkFilness) empty space")
        }
        else {
            print ("Not enougth free space in trunck. Max size of load = \(trunckValue - trunkFilness) liters")
        }
    }
}
var truck = TrunkCar(brandName: .Mesr, modelName: "Truck", color: .black, windowsIsOpened: false, engineIsStarted: false, mileage: 0, trunck: .none)

truck.trunckValue
truck.loadTrunck(value: 1000)
truck.trunck = .jambo
truck.loadTrunck(value: 14222)

extension PassengerCar: CustomStringConvertible {
   public var description: String {
        return "Here we got \(brandName) \(modelName) \(color) color with body type \(bodyType), witch got \(mileage) km mileage"
    }
}
print (car1)
extension TrunkCar: CustomStringConvertible {
   public var description: String {
        return "Here we got \(brandName) \(modelName) \(color) color with body type \(bodyType), witch got \(mileage) km mileage, \(trunck) type of trunck, witch got \(trunckValue) liters space, now free \(trunckValue - trunkFilness) liters space"
    }
}
print(truck)
extension PassengerCar{
    func addMileage (value: Int) {
        if engineIsStarted == true {
            mileage += value
        }
        else {
            print ("Start engine first")
        }
    }
}
car1.startEngine(state: true)
car1.engineIsStarted = true
car1.addMileage(value: 200)
car1.mileage
car1.addMileage(value: 200)
car1.mileage
