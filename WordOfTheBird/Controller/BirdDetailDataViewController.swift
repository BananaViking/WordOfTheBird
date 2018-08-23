//
//  BirdDetailDataViewController.swift
//  Segue
//
//  Created by Banana Viking on 6/13/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit
import AVFoundation

class BirdDetailDataViewController: UITableViewController {
    var audioPlayer: AVAudioPlayer?
    var calls = [String]()
    var infoLink: String?
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount = 0
        if section == 0 {
            rowCount = calls.count
        } else if section == 1 {
            rowCount = 1
        }
        return rowCount
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            playSound(forObject: calls[indexPath.row])
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                audioPlayer?.stop()
                if let infoLink = infoLink {
                    UIApplication.shared.open(URL(string: infoLink)!)
                }
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "backgroundBottom.png"))
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackground), name: .UIApplicationDidEnterBackground, object: nil)
    }
    
    func playSound(forObject: String) {
        guard let url = Bundle.main.url(forResource: forObject, withExtension: "wav") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            guard let audioPlayer = audioPlayer else { return }
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
    }
    
    @objc func didEnterBackground() {
        audioPlayer?.stop()
    }
}

