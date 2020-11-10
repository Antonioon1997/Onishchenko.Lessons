import Foundation

public class Name <T>{
    private var arr1: [T]
    init(arr1: [T]) { self.arr1 = arr1 }
}

extension Name {
    func insertSomeData (data: T)           { return arr1.append(data)}
    func removeFirstDataElement()           { arr1.removeFirst() }
    func removeLastDataElement()            { arr1.removeLast() }
    func removeSomeDataElement(index: Int)  { arr1.remove(at: index) }
    func clearArr ()                        { arr1.removeAll() }
}

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

