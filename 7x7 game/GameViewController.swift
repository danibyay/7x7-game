//
//  GameViewController.swift
//  7x7 game
//
//  Created by Daniela Becerra Gonzalez on 16/12/19.
//  Copyright © 2019 Daniela Becerra Gonzalez. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var UpperStackView: UIStackView!
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var UpNextLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    var score = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ButtonPressed(_ sender: Any) {
        score += 1
        updateScore()
    }
    
    func updateScore() {
        ScoreLabel.text = "Score: \(String(score))"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
