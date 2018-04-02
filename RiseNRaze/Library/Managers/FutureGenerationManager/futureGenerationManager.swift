//
//  FutureGenerationManager.swift
//  RiseNRaze
//
//  Created by Rahul Chona on 02/04/18.
//  Copyright © 2018 Rahul Chona. All rights reserved.
//

import Foundation

class FutureGenerationManager: NSObject {
    
    // MARK: - Variables -
    var row: Int = 0
    var column: Int = 0
    var isRuleOneEnabled: Bool = true
    var isRuleTwoEnabled: Bool = true
    var isRuleThirdEnabled: Bool = true
    var isRuleFourthEnabled: Bool = true
    
    // MARK: - Singleton Instance -
    fileprivate static let _sharedManager = FutureGenerationManager()
    
    class func sharedManager() -> FutureGenerationManager {
        return _sharedManager
    }
    
    fileprivate override init() {
        super.init()
    }
    
    func nextGeneration(presentWorld: [[Int]]) -> [[Int]] {
        
        var futureGrid: [[Int]] = [[Int]]()
        futureGrid.append(contentsOf: presentWorld)
        
        // Loop through every cell
        for index in 1 ..< row - 1 {
            for subIndex in 1 ..< column - 1 {
                
                // finding no Of Neighbours that are alive
                var aliveNeighbours : Int = 0
                for neighboursIndex in -1 ... 1 {
                    for neighboursSubIndex in -1 ... 1 {
                        
                        aliveNeighbours = aliveNeighbours + presentWorld[index + neighboursIndex][subIndex + neighboursSubIndex];
                    }
                }
                
                // The cell needs to be subtracted from
                // its neighbours as it was counted before
                aliveNeighbours = aliveNeighbours - presentWorld[index][subIndex]
                
                //Rules
                
                //Rule#1: Any live cell with fewer than two live neighbours dies, as if caused by under-population.
                if (isRuleOneEnabled && (presentWorld[index][subIndex] == 1) && (aliveNeighbours < 2)) {
                    futureGrid[index][subIndex] = 0
                }

                //Rule#2: Any live cell with two or three live neighbours lives on to the next generation.
                if (isRuleTwoEnabled && (presentWorld[index][subIndex] == 1) && ((aliveNeighbours == 2) || (aliveNeighbours == 3))) {
                    futureGrid[index][subIndex] = 1
                }

                //Rule#3: Any live cell with more than three live neighbours dies, as if by over-population..
                if (isRuleThirdEnabled && (presentWorld[index][subIndex] == 1) && (aliveNeighbours > 3)) {
                    futureGrid[index][subIndex] = 0
                }
                
                //Rule#4: Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
                if (isRuleFourthEnabled && (presentWorld[index][subIndex] == 0) && (aliveNeighbours == 3)) {
                    futureGrid[index][subIndex] = 1
                }

            }
        }
        print("Next Generation")
        printWorldGrid(world: futureGrid)
        return futureGrid
    }
    
    func printWorldGrid(world: [[Int]]) {
        for index in 0 ..< row {
            var rowString : String = ""
            for subIndex in 0 ..< column {
                if world[index][subIndex] == 0 {
                    rowString = rowString + "."
                } else {
                    rowString = rowString + "*"
                }
            }
            print(rowString)
        }
        print("\n")
    }
}
