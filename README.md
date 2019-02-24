# InterviewQns



> Jen coded a bot that takes a pair of integers coordinates, (x, y). Though the bot can move any number of times, it can only > make the following two types of moves:
> From location (x, y) to location (x + y, y).
> From location (x, y) to location (x, x + y).
 
_For example, if the bot starts at (1, 4), it can make the following sequence of moves: (1, 4) → (5, 4) → (5, 9) → (5, 14)._
 
> Complete the canReach function in the editor below. It has four integer parameters: x1, y1, x2, and y2. It must return the  string Yes if it is possible for the bot to start at point (x1, y1) and reach point (x2, y2); otherwise, it must return the string No.
 
Input Format
Locked stub code in the editor reads the following input from stdin and passes it to the function:
The first line contains an integer denoting x1.
The second line contains an integer denoting y1.
The third line contains an integer denoting x2.
The fourth line contains an integer denoting y2.
 
Constraints
*1 ≤ x1, y1, x2, y2 ≤ 1000*
 
> Output Format
> The function must return a string denoting whether or not the bot can reach point (x2, y2) from point (x1, y1). If it is possible, return Yes; otherwise, return No. This is printed to stdout by locked stub code in the editor.
 
 * Sample Input 0
  * 1
  * 4
  * 5
  * 9
 
Sample Output 0
Yes
 
_Explanation 0
start = (1, 4), end = (5, 9)
The bot starts at (1, 4) and makes a move of type 1, meaning that it moves to (1 + 4, 1) = (5, 4). Then it makes a move of type 2 from (5, 4) to (5, 5 + 4) = (5, 9).
The bot successfully moved through the following path: (1, 4) → (5, 4) → (5, 9), which means it was possible to reach (5, 9). Thus, our function returns Yes._
 
* __Sample Input 1__
  * 1
  * 2
  * 2
  * 1
 
* __Sample Output 1__
  * No
 
*Explanation 1*
> start = (1, 2), end = (2, 1)
> Our two types of movement both require an increase in x or y, but the input value for y decreases from the start location to the end location. Thus, it is not possible to reach (2, 1) from (1, 2) and we return No.


## Bruteforce Solution using swift ( This solution doesnt scale very well ) ##


```

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


```
