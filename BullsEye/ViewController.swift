//
//  ViewController.swift
//  BullsEye
//
//  Created by Phillip LeBlanc on 10/7/18.
//  Copyright © 2018 Phillip LeBlanc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 0
    var targetValue: Int = 0
    var currentRound: Int = 0
    var currentScore: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var currentRoundLabel: UILabel!
    @IBOutlet weak var currentScoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startOver()
    }

    @IBAction func showAlert() {
        let difference: Int = abs(currentValue - targetValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        let message = "You scored \(points) points"
        
        currentScore += points
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    @IBAction func startOver() {
        currentRound = 0
        currentScore = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentRound += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetValueLabel.text = String(targetValue)
        currentRoundLabel.text = String(currentRound)
        currentScoreLabel.text = String(currentScore)
    }
}

