//
//  GameViewController.swift
//  7x7 game
//
//  Created by Daniela Becerra Gonzalez on 16/12/19.
//  Copyright © 2019 Daniela Becerra Gonzalez. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

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
        // highlight the square so the user know it's selected.
        // change a bool attribute of the Square model (toggle)
        // first, clean all other squares being selected, except for the last touched.
        // then, change the one that was selected
        
        let currSquare = squaresArray[indexPath.item]
        
        if lastSelectedSquareIndex != nil {
            // stop highlighting the previously selected square (in the model)
            squaresArray[lastSelectedSquareIndex!.item].isSelected = false
            
            // if the currently selected square is different fron the previous one
            if indexPath.item != lastSelectedSquareIndex!.item {
                // if it's not empty, a new selection was made, just highlight.
                if !currSquare.isEmpty() {
                    currSquare.isSelected = true
                }
                // if it is empty, it's a possible next place for the previous square
                else if !squaresArray[lastSelectedSquareIndex!.item].isEmpty() && currSquare.isEmpty() {
                    currSquare.colorCode = squaresArray[lastSelectedSquareIndex!.item].colorCode
                    squaresArray[lastSelectedSquareIndex!.item].setEmpty()
                    // Re-paint
                    let currCell = collectionView.cellForItem(at: indexPath) as! SquareCollectionViewCell
                    currCell.paint(currSquare)
                    let prevCell = collectionView.cellForItem(at: lastSelectedSquareIndex!) as! SquareCollectionViewCell
                    prevCell.paint(squaresArray[lastSelectedSquareIndex!.item])
                    collectionView.reloadItems(at: [indexPath, lastSelectedSquareIndex!])
                    //collectionView.reloadData()
                    // let prevCell = .... what is the indexpath if I have the array index?
                    // prevCell.paint(prevSquare)
                }
            }
        }
        
        
        lastSelectedSquareIndex = indexPath
        
        
        // TODO: if selected -- cell.highlight()
        
        // no estoy recoloreando la vieja, entonces no se movio, solo se copio.
        
        // guardar el ultimo
        // print("last is: \(lastIndex) . Last will be: \(indexPath.item)")
        
        
    }
    
    
    


}
