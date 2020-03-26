//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Marco Galetta on 24/03/2020.
//  Copyright © 2020 Marco Galetta. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        configureUI(.playing)
        switch sender {
        case snailButton:
            playSound(rate: 0.5)
        case rabbitButton:
            playSound(rate: 2.0)
        case chipmunkButton:
            playSound(pitch: 2000)
        case vaderButton:
            playSound(pitch: -1000)
        case echoButton:
            playSound(echo: true)
        case reverbButton:
            playSound(reverb: true)
        default:
            playSound(rate: 1)
        }
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        configureUI(.notPlaying)
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
}
