import Foundation

public class Name <T>{
<<<<<<< HEAD
    private var arr1: [T]
    init(arr1: [T]) { self.arr1 = arr1 }
}

=======
    var arr1: [T]
    init(arr1: [T]) { self.arr1 = arr1 }
}
>>>>>>> Lesson6
extension Name {
    func insertSomeData (data: T)           { return arr1.append(data)}
    func removeFirstDataElement()           { arr1.removeFirst() }
    func removeLastDataElement()            { arr1.removeLast() }
    func removeSomeDataElement(index: Int)  { arr1.remove(at: index) }
    func clearArr ()                        { arr1.removeAll() }
}
<<<<<<< HEAD

extension Name: CustomStringConvertible {
    public var description: String { return "in this array we now got: \(arr1)" }
}

extension Name{
    subscript (index: Int) -> T? {
        guard index>=0,arr1.count>0, index <= arr1.count else {
            return nil
        }; return arr1[index]
    }
}
extension Name {
    func reverseArr () {
        arr1.reverse()
    }
}

=======
extension Name: CustomStringConvertible {
    public var description: String{ return "in this array we now got: \(arr1)" }
}
class NumberArr: Name<Int> {
    func randomArr (range: Int, length: Int) {
        for _ in 1...length{
            let numb = Int.random(in: 0...range)
            arr1.append(numb)
        }
    }
    func sortOnlyOdd(){
        arr1 = arr1.filter({$0 % 2 == 0})
        arr1 = arr1.sorted(by: <)
    }
}
extension NumberArr {
    subscript (index: Int) -> Int {
        return arr1[index-1]
    }
}
var arr2 = NumberArr(arr1: [Int]())
arr2.randomArr(range: 100, length: 20)
print (arr2)
arr2.arr1.count
arr2.sortOnlyOdd()
arr2.arr1.count
print(arr2)
arr2[2]
>>>>>>> Lesson6
