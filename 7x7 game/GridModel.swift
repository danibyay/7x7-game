//
//  GridModel.swift
//  7x7 game
//
//  Created by Daniela Becerra Gonzalez on 17/12/19.
//  Copyright © 2019 Daniela Becerra Gonzalez. All rights reserved.
//

import Foundation

class GridModel {
    
    func getSquares() -> [Square] {
        var generatedSquaresArray = [Square]()
        for _ in 1...49 {
            // TODO: there should be a limit of how many are colored and how many are blank
            // choose the color of the squares
            let randomNumber:UInt32 = arc4random_uniform(6)
            
            // First card object
            let currSquare = Square()
            currSquare.color = randomNumber
            generatedSquaresArray.append(currSquare)

    }
        
        // Return the array
        return generatedSquaresArray
    }
}
