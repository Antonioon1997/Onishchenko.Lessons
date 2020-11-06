import Foundation

enum InstalErrors: Error{
    case notEnouthROM
    case notEnouthRAM
    case wrongRules
}
struct ErrorsOfInstal: Error {
    var errorType: InstalErrors
    var errorCode: Int
    var errorText: String
    var adviceForError: String
}
extension ErrorsOfInstal: CustomStringConvertible {
    var description: String{
        return "ERROR! Error code: \(errorCode). \(errorText). \(adviceForError)"
    }
}
class PC {
    var ROM: Int
    var RAM: Int
    var isAdmin: Bool
    init (ROM: Int, RAM: Int, isAdmin: Bool){
        self.ROM = ROM
        self.RAM = RAM
        self.isAdmin = isAdmin
    }
}
class Software {
    var freeROM: Int
    var freeRAM: Int
    var adminRules: Bool
    init (freeROM: Int, freeRAM: Int, adminRules: Bool){
        self.adminRules = adminRules
        self.freeRAM = freeRAM
        self.freeROM = freeROM
    }
}
var myPC = PC(ROM: 1_000, RAM: 1_000, isAdmin: true)
var photoshop = Software(freeROM: 2000, freeRAM: 10000, adminRules: true)

func instalSoft (_ SoftRAM: Int, _ SoftROM: Int, _ SoftisAdmin: Bool) throws -> Bool {
    guard  myPC.RAM >= SoftRAM else {
        throw ErrorsOfInstal(errorType: .notEnouthRAM, errorCode: 202, errorText: "You don't have enough RAM memory", adviceForError: "Check opened soft and free some RAM space")
    }
    guard  myPC.ROM >= SoftROM else {
        throw ErrorsOfInstal(errorType: .notEnouthROM, errorCode: 303, errorText: "You dont have enough storage memory", adviceForError: "Free some space on your storage")
    }
    guard  myPC.isAdmin == SoftisAdmin else {
        throw ErrorsOfInstal(errorType: .wrongRules, errorCode: 101, errorText: "You don't have ADMIN rules", adviceForError: "Enter to ADMIN account or call for your admin")
    }
    return true
}

do{
    let _ = try instalSoft(photoshop.freeRAM, photoshop.freeROM, photoshop.adminRules)
    print ("Yes, you can")
}
catch {
   
    
    print (error)
}
