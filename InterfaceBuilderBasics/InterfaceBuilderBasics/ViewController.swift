//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by Alexandra Moraru on 14/02/2019.
//  Copyright © 2019 Alexandra Moraru. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var audioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func clickButton(_ sender: UIButton) {
        playSound()
    }
    
    func playSound() {
        //set the file sound name and extension

        guard let url = Bundle.main.url(forResource: "renato-pozzetto", withExtension: "mp3") else {
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            audioPlayer.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
