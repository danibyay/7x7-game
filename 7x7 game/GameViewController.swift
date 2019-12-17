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
            collectionView.dequeueReusableCell(withReuseIdentifier: "Square", for: indexPath)
        setCellColor(cell: cell, index: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
    }
    
    // MARK: - Other
    
    func setCellColor(cell: UICollectionViewCell, index: IndexPath) {
        switch squaresArray[index.item].colorCode {
            case 0:
                cell.contentView.backgroundColor = UIColor.gameNoColor()
            case 1:
                cell.contentView.backgroundColor = UIColor.gameColor1()
            case 2:
                cell.contentView.backgroundColor = UIColor.gameColor2()
            case 3:
                cell.contentView.backgroundColor = UIColor.gameColor3()
            case 4:
                cell.contentView.backgroundColor = UIColor.gameColor4()
            case 5:
                cell.contentView.backgroundColor = UIColor.gameColor5()
            default:
                cell.contentView.backgroundColor = UIColor.gameNoColor()
        
        }
    }
    


}
