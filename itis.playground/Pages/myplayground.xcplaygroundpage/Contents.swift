import UIKit

var str = "Hello, playground"
protocol Student {
    var name: String { get }
    var health: Int { get set }
    var strength: Int { get set }
    
    func summary()
    func getDamage(student: Student)
    func giveDamage(student: Student)
}

protocol Arena {
    var firstTeam: [Team] { get set }
    var secondTeam: [Team] { get set }
    
    func startBattle()
}

class Player: Student {
    var name: String
    var health: Int
    var strength: Int

    init(name: String, health: Int, strength: Int) {
        self.name = name
        self.health = health
        self.strength = strength
    }
    
    func getDamage(student: Student) {
        if self.health > student.strength {
            print(self.name," was ataccked by ",student.name," and lost ",self.health - student.strength," HP")
            print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
            self.health -= student.strength
        }
        else {
            print(self.name," is dead now!!!!!!!!!! FATALITY")
            print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
            self.health = 0
        }
    }
    
    func giveDamage(student: Student) {
        if student.health > self.strength{
            print(self.name," started fighting with ",student.name," and hit with the ",self.strength," strength")
            print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
        }
        else{
            print(self.name," defeated ",student.name," MDAMAYZING !!!!!!!!")
            print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
        }
    }
    
    func summary() {
        print("STUDENT NAME:",self.name)
        print("HEALTH:",self.health)
        print("STRENGTH:",self.strength)
        print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
    }
}

class Team {
    var students: [Student]
    var fractionName: String
    var motto: String
    var givenDamage: Int
    
    init(students: [Student], fractionName: String, motto: String, givenDamage: Int) {
        self.students = students
        self.fractionName = fractionName
        self.motto = motto
        self.givenDamage = givenDamage
    }
    
    func summary() {
        print(self.students.count," fighters left. Is it enough to continue battle?")
        print(self.givenDamage," damage given by the Team")
        for student in self.students{
            student.summary()
        }
        print("END OF SUMMARY")
    }
    
    func deadStudentsTrash() {
        var infinites: [Student] = []
        var count = 0
        for student in infinites {
            if student.health == 0 {
                print(student.name,"left our peaceful party. What a pity!")
                print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
                infinites.remove(at: count)
                count += 1
            }
        }
        self.students = infinites
    }
}

class GhettoGarden: Arena {
    
    var firstTeam: [Team]
    var secondTeam: [Team]
    
    init(firstTeam: [Team], secondTeam: [Team]) {
        self.firstTeam = firstTeam
        self.secondTeam = secondTeam
    }
    
    func startBattle() {
        var game = 1
        
        print("Hello! Wanna go dancin'? Time for a f(l)ightshow")
        print("Community's favourite game iS BACK!")
        print("Introducing our teams!")
        print("First team name is ",firstTeam[0].fractionName," and team's electrified motto! ",firstTeam[0].motto)
        print("Second team name is ",secondTeam[0].fractionName," and team's even more electrified motto! ",secondTeam[0].motto)
        
        while firstTeam.count > 0 && secondTeam.count > 0 {
            print("Our Game number",game," starts now!")
            for player in firstTeam[0].students{
                let target = secondTeam[0].students.shuffled().first
                guard let prevHealth = target?.health else { return }
                target?.giveDamage(student: player)
                guard let curHealth = target?.health else { return }
                firstTeam[0].givenDamage += prevHealth - curHealth
            }
            
            for player in firstTeam[0].students {
                let target = secondTeam[0].students.shuffled().first
                guard let prevHealth = target?.health else { return  }
                target?.getDamage(student: player)
                guard let curHealth = target?.health else { return }
                secondTeam[0].givenDamage += prevHealth - curHealth
            }
            
            print("Good job, snickers! Your Game",game," is over.")
            print("Change panties and wait for results...")
            game += 1
            firstTeam[0].summary()
            secondTeam[0].summary()
            deadTeamTrash()
        }
    }
    
    func deadTeamTrash() {
        for teammate in firstTeam {
            teammate.deadStudentsTrash()
        }
        for teammate in secondTeam {
            teammate.deadStudentsTrash()
        }
        
        if secondTeam.count == 0 && firstTeam.count > 0 {
            firstTeamWins()
            print("What a fortune! ",secondTeam[0].fractionName," is dead!")
        }
        
        else if firstTeam.count == 0 && secondTeam.count > 0 {
            secondTeamWins()
            print("What a fortune! ",firstTeam[0].fractionName," is dead!")
        }
    }
    
    func firstTeamWins() {
        print("Our winner is ",firstTeam[0].fractionName,"! Your scars are a reason for pride")
    }
    
    func secondTeamWins() {
        print("Our winner is ",secondTeam[0].fractionName,"! Your tears are a reason for pride")
    }
}

var firstTeamPlayers: [Player] = [(Player(name: "Abooba", health: 2, strength: 0))]
var secondTeamPlayers: [Player] = [(Player(name: "Pisaka", health: 25, strength: 5))]

var team1 = Team(students: firstTeamPlayers, fractionName: "Speakers", motto: "go go speak speak!", givenDamage: 0)
var team2 = Team(students: secondTeamPlayers, fractionName: "Bikers", motto: "bikes bikes for a rise!", givenDamage: 0)

GhettoGarden(firstTeam: team1, secondTeam: team2)
