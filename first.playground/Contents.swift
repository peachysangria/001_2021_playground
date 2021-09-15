import Foundation

class Flower {
    private var petals: Int
    private var size: Int = 0
    
    init(petals: Int) {
        self.petals = petals;
    }
    
    public func growth() -> Void {
        size += petals
        print(size)
    }
}

class Count {
    public static func flowerGrowth(flower: Flower){
        flower.growth()
    }
}

class Daisy: Flower {
    private var height: Int = 10
}

var daisy = Daisy(petals: 20)
daisy.growth()

Count.flowerGrowth(flower: daisy)
