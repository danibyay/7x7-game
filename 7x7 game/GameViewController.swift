//
//  GameViewController.swift
//  7x7 game
//
//  Created by Daniela Becerra Gonzalez on 16/12/19.
//  Copyright © 2019 Daniela Becerra Gonzalez. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var UpperStackView: UIStackView!
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var UpNextLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var score = 0;
    var model = GridModel()
    var squaresArray = [Square]()
    var lastSelectedSquareIndex:IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        squaresArray = model.getSquares()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateScore() {
        ScoreLabel.text = "Score: \(String(score))"
    }
    
    // MARK: - UICollectionView Protocol Methods
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return squaresArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "Square", for: indexPath) as! SquareCollectionViewCell
        let square = squaresArray[indexPath.item]
        cell.paint(square)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        let currSquare = squaresArray[indexPath.item]
        let currCell = collectionView.cellForItem(at: indexPath) as! SquareCollectionViewCell
        var successfulMove = false
        
        // if the selected square is not empty, it can be highlighted.
        if !currSquare.isEmpty() {
            currSquare.isSelected = true
            currCell.select()
        }
        
        if lastSelectedSquareIndex != nil {
            let prevCell = collectionView.cellForItem(at: lastSelectedSquareIndex!) as! SquareCollectionViewCell
            // stop highlighting the previously selected square (in the model)
            squaresArray[lastSelectedSquareIndex!.item].isSelected = false
            prevCell.deselect()
            
            // if the currently selected square is different fron the previous one
            if indexPath.item != lastSelectedSquareIndex!.item {
                // if it is empty, it's a possible next place for the previous square
                // TODO: verify that the path to the next square is valid
                if !squaresArray[lastSelectedSquareIndex!.item].isEmpty() && currSquare.isEmpty() {
                    // "Move" the square by passing the color to the next position.
                    currSquare.colorCode = squaresArray[lastSelectedSquareIndex!.item].colorCode
                    squaresArray[lastSelectedSquareIndex!.item].setEmpty()
                    // Re-paint both squares involved
                    currCell.paint(currSquare)
                    prevCell.paint(squaresArray[lastSelectedSquareIndex!.item])
                    collectionView.reloadItems(at: [indexPath, lastSelectedSquareIndex!])
                    successfulMove = true
                }
            }
        }
        
        if !successfulMove {
           lastSelectedSquareIndex = indexPath
        } else {
            lastSelectedSquareIndex = nil
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 10
        let itemSize = (collectionView.frame.width) / 9
        return CGSize(width: itemSize, height: itemSize)
    }


}
