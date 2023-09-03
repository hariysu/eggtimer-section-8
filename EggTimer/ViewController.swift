//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    var secondsRemaining : Int?
    var timer = Timer()
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    @IBOutlet weak var messageToUser: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        messageToUser.text = "How do you like your eggs?"
        
        let hardness = sender.currentTitle!
        
        //print(eggTimes[hardness]!)
        secondsRemaining = eggTimes[hardness]!
        
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(UIMenuController.update), userInfo: nil, repeats: true)
        
//        if hardness == "Soft" {
//            print(softTime)
//        }
//        else if hardness == "Medium" {
//            print(mediumTime)
//        }
//        else {
//            print(hardTime)
//        }
        
//        switch hardness {
//        case "Soft":
//            print(softTime)
//        case "Medium":
//            print(mediumTime)
//        case "Hard":
//            print(hardTime)
//        default:
//            print("Error")
//        }
    }
    
    @objc func update() {
        if(secondsRemaining! > 0) {
            print("\(secondsRemaining!) seconds")
            secondsRemaining! -= 1
        }else {
            messageToUser.text = "Done"
            timer.invalidate()
        }
    }
}

