import UIKit

var str = "Hello, playground"
protocol Student{
    var fractionName : String { get set }
    var health : Int { get set }
    var strength : Int { get set }
    var moto : String { get set }
    
    func getDamage ( student : Student)
    func giveDamage ( student : Student)
}

protocol Arena{
    var firstTeam : [Student] { get set }
    var secondTeam : [Student] { get set }
    func startBattle()
}

class Player:Student{
    var fractionName: String
    var health: Int
    var strength: Int
    var moto: String

    init(fractionName:String, health:Int, strength:Int){
        self.fractionName = fractionName
        self.health = health
        self.strength = strength
        self.moto = ""
    }
    
    func getDamage(student : Student) {
        if self.health > student.strength {
            print(self.name" was ataccked by "student.name" and lost "self.health - student.strength" HP")
            self.health -= student.strength
        }
        else {
            print(self.name" is dead now!!!!!!!!!! FATALITY")
            self.health = 0
        }
    }
    
    func giveDamage(student: Student) {
        if student.health > self.strength{
            print(self.name" started fighting with "student.name" and borrowed "student.health - self.strength" HP")
        }
        else{
            print(self.name" defeated "student.name" MDAMAYZING WIN!!!!!!!!")
        }
    }
}

class BattleArena:Arena{
    var firstTeam:[Student]
    var secondTeam:[Student]
    
    func startBattle(){
        print ("Hello! Wanna go dancin'? Choose the team's quanity")
        self.firstTeam = 5
        self.secondTeam = 6
                        
    }
}

