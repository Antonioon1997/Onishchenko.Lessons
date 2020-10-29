import Foundation

    enum BrandName{
        case Nissan, Mazda, Opel, Gazel, Volvo, Mesreses
    };enum BodyType{
        case sedan, hatchback, pickup, crossover, truck
    };enum Color {
        case black, white, red, gold, silver
    };enum Doorstate {
        case open, close
    };enum Transmission {
        case manual, auto
    };enum Windowstate {
        case open, close
    };enum Gasoline {
        case empty, full
    }
    struct Car {
    let color: Color
    var bodytype: BodyType
    let brandName: BrandName
    let year: Int
    var doorset: Doorstate{
        willSet {
            if newValue == .open{
               print ("Door's of \(bodytype) \(brandName) are opened")
            } else {
                print ("Door's of \(bodytype) \(brandName) are closed")
            }
        }
    }
    let transmissin: Transmission
    var windowstate: Windowstate
    var gasoline: Gasoline
    var isEngineStart: Bool{
        willSet {
            if gasoline == .full{
            if newValue == true {
                print ("Engine of \(bodytype) \(brandName) starting")
            } else {
                print ("Engine \(bodytype) \(brandName) stop")
                }
            }else {
                print ("Tank of \(bodytype) \(brandName)  is empty, please, load tank")
            }
        }
    }
    var mileage: Int {
        didSet {
            print ("Mileage of \(bodytype) \(brandName)  increased by \(mileage) km. Now it's \(mileage + oldValue) km")
        }
    }
    let bodyVolume: Double
    let trunkVolume: Double
    var trunkFilness: Double{
        willSet {
            let currentFilness = trunkFilness + newValue
            if currentFilness < trunkVolume {
                print ("Left free space in trunk of \(bodytype) \(brandName): \(trunkVolume - currentFilness) liters")
            } else if trunkFilness < currentFilness {
               print ("Trunk of \(bodytype) \(brandName) is too small for this")
            }
        }
    }
}
var anycar = Car.init(color: .black, bodytype: .hatchback, brandName: .Mesreses, year: 2010, doorset: .close, transmissin: .auto, windowstate: .close, gasoline: .empty, isEngineStart: false, mileage: 0, bodyVolume: 10000, trunkVolume: 10000, trunkFilness: 0)
   
    anycar.isEngineStart = true
    anycar.gasoline = .full
    anycar.isEngineStart = true
    anycar.mileage = 140
    anycar.mileage = 122

var anyTruck = Car.init(color: .black, bodytype: .truck, brandName: .Mesreses, year: 2010, doorset: .close, transmissin: .auto, windowstate: .open, gasoline: .full, isEngineStart: false, mileage: 0, bodyVolume: 100000, trunkVolume: 200000, trunkFilness: 0)
    
    anyTruck.trunkFilness = 200000
    anyTruck.doorset = .close
    anyTruck.isEngineStart = true
    anyTruck.windowstate = .close
