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
        cell.contentView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
    }
    


}
