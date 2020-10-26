import Foundation

var arr1 = [Int] ()
var arr2 = [Int] ()
var carrentNumb = 0
var simpleNambers = [Int] ()

func arrayRandomGenerator(){
    for _ in 1...100 {
        arr1 += [Int.random(in: 1...100)]
    }
}; func DevisionOnThgree () {
    arr1.map({$0 % 3 == 0 ? print ("\($0) is divised by 3") : print ("\($0) isn't divised by 3")})
}; func arraySequenceGenerator () {
    for i in 1...100{
        arr1 += [i]
    }
}; func arrayFilter () {
    arr1 = arr1.filter({$0 % 2 != 0})
    arr1 = arr1.filter({$0 % 3 != 0})
}; func fibNumbers () {
    arr1 = [0,1,1]
    for i in 3...90 {
        carrentNumb = arr1 [i-1] + arr1 [i-2]
        arr1.append(carrentNumb)
    }
}; func naturalNumbers () {
    for i in 2...100 {
        arr1 += [i]
    }; repeat {
        carrentNumb = arr1.remove(at: 0)
        simpleNambers += [carrentNumb]
        arr1 = arr1.filter({$0 % carrentNumb != 0})
    } while arr1.count > 0
}
