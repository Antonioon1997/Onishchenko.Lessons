import Foundation

enum BrandName{
    case Mersedes, Mazda, Opel, MAZ, Nissan, BMW
}; enum BodyType{
    case sedan, hatchback, crossover, truck
}; enum Color{
    case white, black, green, blue, yellow
}; enum Transmission{
    case auto, manual
}; enum WindowsState{
    case open, closed
}; enum DoorState{
    case open, closed
}; enum TruckType{
    case truck, furgon
}; enum TrunkType{
    case jumbo, cistern, tent, none
}; enum Gasoline{
    case empty, full
}; enum isEngineStarted{
    case start, stop
}

class AnyCar {
    let brandName: BrandName
    let modelName: String
    var bodyType: BodyType
    let color: Color
    let transmission: Transmission
    var windowsState: WindowsState{
        willSet{
            if newValue == .closed {
                print ("Windows of \(bodyType) \(brandName) \(modelName) now closed")
            } else {
                print ("Windows of \(bodyType) \(brandName) \(modelName) now opened")
            }
        }
    }
    var doorState: DoorState{
        willSet {
            if newValue == .closed {
                print ("Doors of \(bodyType) \(brandName) \(modelName)  now closed")
            } else {
                print ("Doors of \(bodyType) \(brandName) \(modelName)  now opened")
            }
        }
    }
    var gasoline: Gasoline
    var isEngineStarted: isEngineStarted
    var mileage: Int
    
    init (brandName: BrandName, modelName: String, bodyType: BodyType, color: Color, transmission: Transmission, windowsState: WindowsState, doorState: DoorState, gasoline: Gasoline, isEngineStarted: isEngineStarted, mileage: Int){
        self.brandName = brandName
        self.modelName = modelName
        self.bodyType = bodyType
        self.color = color
        self.transmission = transmission
        self.windowsState = windowsState
        self.doorState = doorState
        self.gasoline = gasoline
        self.isEngineStarted = isEngineStarted
        self.mileage = mileage
    }
    func addMileage (value: Int) {
        if gasoline == .empty && isEngineStarted == .stop {
            print ("Tunk of \(bodyType) \(brandName) \(modelName) is empty and engine is stoped. Fix it before start movement")
        }
        else if gasoline == .empty && isEngineStarted == .start {
            print ("Tunk of \(bodyType) \(brandName) \(modelName) is empty. Load tunk first")
        }
        else if gasoline == .full && isEngineStarted == .stop {
            print ("Engine of \(bodyType) \(brandName) \(modelName)  is stoped. Start the engine first")
        } else {
            mileage += value
            print ("Mileage of \(bodyType) \(brandName) \(modelName)  increased by \(value) km. Now it's = \(mileage) km")
        }
    }
    func loadTunk(){
        self.gasoline = .full
    }
    func startEngine(value: Bool) {
        if value == true{
        if gasoline == .empty {
            print ("Tunk of \(bodyType) \(brandName) \(modelName) is empty, please, load tunk")
            self.isEngineStarted = .stop
        } else {
            print ("Engine of \(bodyType) \(brandName) \(modelName) now started")
            self.isEngineStarted = .start
            }
        }
        else if value == false {
            self.isEngineStarted = .stop
            print ("Engine of \(bodyType) \(brandName) \(modelName) now stoped")
        }
    }
}

class PassengerCar: AnyCar{
    var maxSpeed: Int
    var isSportCar: Bool{
        if maxSpeed >= 200{
            return true
        }
        else{
            return false
        }
    }
    var bodyValue: Int
    init (brandName: BrandName, modelName: String, bodyType: BodyType, color: Color, transmission: Transmission, maxSpeed: Int,  windowsState: WindowsState, doorState: DoorState, gasoline: Gasoline, isEngineStarted: isEngineStarted, mileage: Int, bodyValue: Int){
        self.maxSpeed = maxSpeed
        self.bodyValue = bodyValue
        super.init(brandName: brandName, modelName: modelName, bodyType: bodyType, color: color, transmission: transmission, windowsState: windowsState, doorState: doorState, gasoline: gasoline, isEngineStarted: isEngineStarted, mileage: mileage)
    }
}

class TruckCar: AnyCar{
    let truckType: TruckType
    var trunkType: TrunkType
    var trunkValue:Int{
        switch trunkType {
        case .cistern:
            return 80_000
        case .jumbo:
            return 120_000
        default:
            return 100_000
        }
    }
    var trunkFilness: Int
    init (brandName: BrandName, modelName: String, truckType: TruckType, trunkType: TrunkType, trunkFilness: Int,  color: Color, transmission: Transmission, windowsState: WindowsState, doorState: DoorState, gasoline: Gasoline, isEngineStarted: isEngineStarted, mileage: Int){
        self.truckType = truckType
        self.trunkType = trunkType
        self.trunkFilness = trunkFilness
        super.init(brandName: brandName, modelName: modelName, bodyType: .truck, color: color, transmission: transmission, windowsState: windowsState, doorState: doorState, gasoline: gasoline, isEngineStarted: isEngineStarted, mileage: mileage)
    }
    func loadToTrunk (value: Int){
        if value > trunkValue-trunkFilness {
            print ("You can't load such a large load into trunk of \(bodyType) \(brandName) \(modelName)")
        }
        else {
            trunkFilness += value
            print ("In trunk of \(bodyType) \(brandName) \(modelName) left \(trunkValue - trunkFilness) empty space")
        }
    }
}
var car = PassengerCar(brandName: .Mersedes, modelName: "XXXX", bodyType: .crossover, color: .black, transmission: .auto, maxSpeed: 220, windowsState: .closed, doorState: .closed, gasoline: .empty, isEngineStarted: .start, mileage: 0, bodyValue: 20_000)
    car.startEngine(value: false)
    car.isEngineStarted
    car.startEngine(value: true)
    car.isEngineStarted
    car.loadTunk()
    car.startEngine(value: true)
    car.isEngineStarted
    car.addMileage(value: 100)
    car.addMileage(value: 132)
    car.mileage

var truck = TruckCar(brandName: .MAZ, modelName: "KAMAZ", truckType: .truck, trunkType: .jumbo, trunkFilness: 0, color: .white, transmission: .auto, windowsState: .closed, doorState: .open, gasoline: .full, isEngineStarted: .start, mileage: 0)
    truck.trunkValue
    truck.loadToTrunk(value: 100_000)
    truck.loadToTrunk(value: 21_000)
    truck.doorState = .closed
    truck.startEngine(value: false)

