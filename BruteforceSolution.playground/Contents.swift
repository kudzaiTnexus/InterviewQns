import UIKit


func moveA(x: Int, y: Int) -> (Int, Int) {
    return (x+y, y)
}

func moveB(x: Int, y: Int) -> (Int, Int) {
    return (x, x+y)
}

func verifyCoordinatesInBoundOfTarget(intialX: Int, initialY: Int, botCurrentCoordinates: (Int,Int), targetCoordinates: (Int,Int)) -> (Int, Int) {
    
    var currentX: Int = botCurrentCoordinates.0
    var currentY: Int = botCurrentCoordinates.1
    
    if currentX > targetCoordinates.0 || currentY > targetCoordinates.1 {
        currentX = intialX
        currentY = initialY
        print("\n reset Bot to initial Coordinates \n")
    }
    
    return (currentX,currentY)
}

func selectMove(currentLocation: (Int,Int), botCoordinates: (Int,Int)) -> (Int,Int) {
    
    if Int.random(in: 0...1) == 0 {
        print("Selected -> moveA")
        return moveA(x: currentLocation.0, y: currentLocation.1)
    } else {
        print("Selected -> moveB")
        return moveB(x: currentLocation.0, y: currentLocation.1)
    }
}

func canReach(x1: Int, y1: Int, x2: Int, y2:Int) -> String {
    var reachedTarget: String = "No"
    var didNotFindCoordinates: Bool = true
    var botCoordinates: (Int,Int) = (x1,y1)
    var maximumIteration: Int = 0
    
    while(didNotFindCoordinates && maximumIteration != 1000 ) {
        
        let revisedCoordinates = verifyCoordinatesInBoundOfTarget(intialX: x1, initialY: y1, botCurrentCoordinates: botCoordinates, targetCoordinates: (x2,y2))
        
        botCoordinates = selectMove(currentLocation: revisedCoordinates, botCoordinates: botCoordinates)
        
        print("( " + String(botCoordinates.0) + " , " + String(botCoordinates.1) + " )")
        
        if (botCoordinates == (x2,y2)) {
            didNotFindCoordinates = false
            reachedTarget = "Yes"
        }
        
        maximumIteration += 1
    }
    
    return reachedTarget
    
}

print(canReach(x1: 1, y1: 4, x2: 20, y2: 13))



