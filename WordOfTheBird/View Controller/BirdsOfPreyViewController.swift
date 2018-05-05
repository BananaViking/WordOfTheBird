//
//  BirdsOfPreyViewController.swift
//  WordOfTheBird
//
//  Created by Derek E Little on 5/3/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit
import AVFoundation

class BirdsOfPreyViewController: UIViewController {
    var player: AVAudioPlayer?
    
    @IBAction func bird300Tapped(_ sender: UIButton) {
        playSound(forBird: "americanKestrel")
    }
    
    @IBAction func bird301Tapped(_ sender: UIButton) {
        playSound(forBird: "baldEagle")
    }
    
    @IBAction func bird302Tapped(_ sender: UIButton) {
        playSound(forBird: "greatHornedOwl")
    }
    
    @IBAction func bird303Tapped(_ sender: UIButton) {
        playSound(forBird: "peregrineFalcon")
    }
    
    @IBAction func bird304Tapped(_ sender: UIButton) {
        playSound(forBird: "barredOwl")
    }
    
    @IBAction func bird305Tapped(_ sender: UIButton) {
        playSound(forBird: "redTailedHawk")
    }
    
    func playSound(forBird: String) {
        guard let url = Bundle.main.url(forResource: forBird, withExtension: "wav") else {
            print("url not found")
            return
        }
        
        do {
            /// this codes for making this app ready to takeover the device audio
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            player!.play()
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
    }
}
