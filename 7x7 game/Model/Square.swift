//
//  Square.swift
//  7x7 game
//
//  Created by Daniela Becerra Gonzalez on 17/12/19.
//  Copyright © 2019 Daniela Becerra Gonzalez. All rights reserved.
//

import Foundation

class Square {
    var colorCode:UInt32 = 0
    var isSelected:Bool = false
    
    func isEmpty() -> Bool {
        return self.colorCode == 0
    }
    
    func setEmpty() {
        colorCode = 0
    }
    
    // make an enum type for the different (5) possible colors or patterns
    // in the future.
}
