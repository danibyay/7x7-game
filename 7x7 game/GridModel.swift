//
//  GridModel.swift
//  7x7 game
//
//  Created by Daniela Becerra Gonzalez on 17/12/19.
//  Copyright © 2019 Daniela Becerra Gonzalez. All rights reserved.
//

import Foundation

class GridModel {
    let INITIAL_SQUARES = 12
    func getSquares() -> [Square] {
        var generatedSquaresArray = [Square]()
        var countUsedSquares = 0
        for _ in 1...49 {
            // TODO: there should be a limit of how many are colored and how many are blank
            // choose the color of the squares
            let currSquare = Square()
            let isUsed:UInt32 = arc4random_uniform(2)
            if isUsed != 0 && countUsedSquares < INITIAL_SQUARES {
                let randomNumber:UInt32 = arc4random_uniform(5) + 1
                currSquare.colorCode = randomNumber
                countUsedSquares += 1
            }
            print("used squares: \(countUsedSquares), color used: \(currSquare.colorCode)")
            generatedSquaresArray.append(currSquare)

    }
        
        // Return the array
        return generatedSquaresArray
    }
}
