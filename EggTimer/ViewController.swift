//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var progressVar: UIProgressView!
    
    let eggTimes : [String: Int] = [
        "Soft": 3, "Medium":5, "Hard":7
    ]
    
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()
    
    @IBAction func buttonPressed(_ sender: UIButton) {

        timer.invalidate()
        
        let hardness = sender.currentTitle!
   
//        if hardness == "Soft"{
//            print(softTime)
//        }else if hardness == "Medium"{
//            print(mediumTime)
//        }else{
//            print(hardTime)
//        }
        totalTime = eggTimes[hardness]!
        
        progressVar.progress = 0.0
        secondsPassed = 0
        titleView.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:  #selector(updateTimer), userInfo: nil, repeats: true)
//        switch hardness {
//        case "Soft":
//            print(eggTimes[hardness!]!)
//        case "Medium":
//            print(eggTimes["Medium"]!)
//        case "Hard":
//            print(eggTimes["Hard"]!)
//        default:
//            print("Error")
//        }
    }
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            progressVar.progress = percentageProgress
            print(percentageProgress)
        }else{
            timer.invalidate()
            playSound()
            titleView.text = "DONE!"
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }

}
