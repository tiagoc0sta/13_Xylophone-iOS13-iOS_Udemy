//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func KeyPressed(_ sender: UIButton) {
        //print("I got pressed")
        //print(sender.currentTitle)
        
        // Change opacity to 50%
        sender.alpha = 0.5
        
        playSound(soundName: sender.currentTitle!) // Use the actual sound file name here
        
        // Restore opacity after 0.2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 2.0
        }
    }
    
    
    func playSound(soundName: String) {
            if let soundURL = Bundle.main.url(forResource: soundName, withExtension: "wav") {
                do {
                    player = try AVAudioPlayer(contentsOf: soundURL)
                    player?.play()
                } catch {
                    print("Error loading audio file: \(error)")
                }
            }
        }

}

