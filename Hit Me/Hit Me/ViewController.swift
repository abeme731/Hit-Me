 //
//  ViewController.swift
//  Hit Me
//
//  Created by A on 9/2/18.
//  Copyright © 2018 A. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue  = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        
        startNewGame()
    
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
      
        let insets = UIEdgeInsetsMake( 0 , 14, 0, 14)
        
        let trackLeftImage =  #imageLiteral(resourceName: "SliderTrackLeft")
        _ = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftImage, for: .normal)
        
        let trackRightImage =  #imageLiteral(resourceName: "SmallButton")
        _ = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightImage, for: .normal)
    }

    @IBAction func showAlert(){
        
    
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        var bonus = 0
        
        score += points
        
        let title: String
        if difference == 0{
            title = "Perfect!"
            bonus = 100
            score += 100
        }else if difference < 5 {
            title = "You almost had it!"
            bonus = 50
            score +=  50
        }else if difference < 10{
            title = "Pretty good!"
            bonus = 0
        }else{
            title = "Not even close!"
            bonus = 0
        }
        
        let message =  "\nYou Scored :\(points) pts \nand:\(bonus) bonus pts"
        
        
        
        let alert = UIAlertController (title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in self.startNewRound()
            
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
       
        
  }
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        
 }
func startNewRound(){
    
     round += 1
    targetValue = Int(arc4random_uniform(100))+1
    currentValue = 50
    slider.value = Float(currentValue)
    updateLabels()
    
   
    }
func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
 func  startNewGame() {
        score = 0
        round = 0
        startNewRound()
        
    }
    @IBAction func startOver(){
        startNewGame()
        
    }
}
 
