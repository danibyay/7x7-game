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
        
        let lastIndex = model.getLastSelectedSquareIndex()
        let currSquare = squaresArray[indexPath.item]
        
        if lastIndex < 50 {
            squaresArray[lastIndex].isSelected = false
        }
        if indexPath.item != lastIndex {
            if !currSquare.isEmpty() {
                currSquare.isSelected = true
            } else if lastIndex < 50 && !squaresArray[lastIndex].isEmpty() &&
               currSquare.isEmpty() {
                    currSquare.colorCode = squaresArray[lastIndex].colorCode
                    squaresArray[lastIndex].setEmpty()
                    // Re-paint
                // TODO: why does this take so long to be visible/updated?
                    let currCell = collectionView.cellForItem(at: indexPath) as! SquareCollectionViewCell
                    currCell.paint(currSquare)
                    // let prevCell = .... what is the indexpath if I have the array index?
                    // prevCell.paint(prevSquare)
            }
        }
        
        // TODO: if selected -- cell.highlight()
        
        // no estoy recoloreando la vieja, entonces no se movio, solo se copio.
        
        // guardar el ultimo
        model.setLastSelectedSquareIndex(index: indexPath.item)
        print("last is: \(lastIndex) . Last will be: \(indexPath.item)")
        
        
    }
    
    
    


}
