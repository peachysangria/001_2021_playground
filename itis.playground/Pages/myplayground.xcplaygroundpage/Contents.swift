import UIKit

var str = "Hello, playground"
protocol Student {
    var fractionName: String { get set }
    var health: Int { get set }
    var strength: Int { get set }
    var motto: String { get set }
    
    func summary ()
    func getDamage (student: Student)
    func giveDamage (student: Student)
}

protocol Arena {
    var firstTeam: [Team] { get set }
    var secondTeam: [Team] { get set }
    
    func startBattle()
}

class Player: Student {
    var fractionName: String
    var health: Int
    var strength: Int
    var motto: String

    init(fractionName: String, health: Int, strength: Int) {
        self.fractionName = fractionName
        self.health = health
        self.strength = strength
        self.motto = ""
    }
    
    func getDamage(student: Student) {
        if self.health > student.strength {
            print(self.fractionName," was ataccked by ",student.fractionName," and lost ",self.health - student.strength," HP")
            print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
            self.health -= student.strength
        }
        else {
            print(self.fractionName," is dead now!!!!!!!!!! FATALITY")
            print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
            self.health = 0
        }
    }
    
    func giveDamage(student: Student) {
        if student.health > self.strength{
            print(self.fractionName," started fighting with ",student.fractionName," and hit with the ",self.strength," strength")
            print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
        }
        else{
            print(self.fractionName," defeated ",student.fractionName," MDAMAYZING !!!!!!!!")
            print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
        }
    }
    
    func summary() {
        let seconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            print ("STUDENT NAME:",self.fractionName)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds * 2) {
            print ("HEALTH:",self.health)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds * 3) {
            print ("STRENGTH:",self.strength)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds * 4) {
            print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
        }
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
    
    func summary(){
        print(self.students.count," fighters left. Is it enough to continue battle?")
        print(self.givenDamage," damage given by the Team")
        for student in self.students{
            student.summary()
        }
        print ("END OF SUMMARY")
    }
    
    func deadStudentsTrash() {
        var infinites: [Student] = []
        var count = 0
        for student in infinites
        {
            if student.health == 0 {
                print(student.fractionName,"left our peaceful party. What a pity!")
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
        let seconds = 1.5
        
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
            
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                print("Good job, snickers! Your Game",game," is over.")
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds * 2) {
                print("Change panties and wait for results...")
            }
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

var players1: [Player] = []
players1.append(Player(fractionName: "Peter", health: 100, strength: 10))
players1.append(Player(fractionName: "John", health: 100, strength: 10))
players1.append(Player(fractionName: "Mike", health: 100, strength: 4))
players1.append(Player(fractionName: "Andrew", health: 300, strength: 2))
players1.append(Player(fractionName: "Oleg", health: 100, strength: 10))

var players2: [Player] = []
players2.append(Player(fractionName: "Tim", health: 100, strength: 10))
players2.append(Player(fractionName: "Tom", health: 100, strength: 10))
players2.append(Player(fractionName: "Derp", health: 100, strength: 8))
players2.append(Player(fractionName: "Will", health: 100, strength: 5))
players2.append(Player(fractionName: "Leila", health: 100, strength: 9))


var team1 = Team(students: players1, fractionName: "Speakers", motto: "go go speak speak!", givenDamage: 0)
var team2 = Team(students: players2, fractionName: "Bikers", motto: "bikes bikes for a rise!", givenDamage: 0)

GhettoGarden(firstTeam: team2, secondTeam: team1).startBattle()
