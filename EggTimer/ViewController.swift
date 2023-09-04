//
//  ViewController.swift
//  EggTimer
//
//  Created by Abdurahman AYDIN on 04/09/2023.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    @IBOutlet weak var messageToUser: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    //var secondsRemaining : Int?
    var timer = Timer()
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var totalTime = 0
    var secondsPassed = 0
    
    var player: AVAudioPlayer!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        
        messageToUser.text = hardness
        
        //print(eggTimes[hardness]!)
        totalTime = eggTimes[hardness]!
        secondsPassed = 0
        progressView.progress = 0.0
        
        
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(UIMenuController.update), userInfo: nil, repeats: true)
        
    }
    
    @objc func update() {
        if(totalTime > secondsPassed) {
            secondsPassed += 1
            progressView.progress = Float(secondsPassed) / Float(totalTime)
        }else {
            messageToUser.text = "Done"
            timer.invalidate()
            secondsPassed = 0
            playSound()
        }
    }
    
    func playSound() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
                    
        }
}

