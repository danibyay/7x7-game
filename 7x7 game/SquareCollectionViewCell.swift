//
//  SquareCollectionViewCell.swift
//  7x7 game
//
//  Created by Daniela Becerra Gonzalez on 17/12/19.
//  Copyright © 2019 Daniela Becerra Gonzalez. All rights reserved.
//

import UIKit

class SquareCollectionViewCell: UICollectionViewCell {
    
    var square:Square?
    func paint(_ square:Square) {
        switch square.colorCode {
        case 0:
            self.contentView.backgroundColor = UIColor.gameNoColor()
        case 1:
            self.contentView.backgroundColor = UIColor.gameColor1()
        case 2:
            self.contentView.backgroundColor = UIColor.gameColor2()
        case 3:
            self.contentView.backgroundColor = UIColor.gameColor3()
        case 4:
            self.contentView.backgroundColor = UIColor.gameColor4()
        case 5:
            self.contentView.backgroundColor = UIColor.gameColor5()
        default:
            self.contentView.backgroundColor = UIColor.gameNoColor()
            
        }
    }
    
    // method to highlight that the square is selected
    func select() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.contentView.alpha = 0.5
        }, completion: nil)
    }
    
    func deselect() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.contentView.alpha = 1.0
        }, completion: nil)
    }
}
