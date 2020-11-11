//
//  ViewController.swift
//  stop-watch
//
//  Created by Paulo Dallastra on 11/8/20.
//  Copyright © 2020 Paulo Dallastra. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var timer: Timer?
    var isStarted = false
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @objc func UpdateTimer() {
        counter += 0.1
        timerLabel.text = String(round(counter*10)/10)
    }

    @IBAction func startStopTouched(_ sender: UIButton) {
        
        if isStarted {
            timer?.invalidate()
            isStarted = false
            startStopButton.setTitle("Start", for: .normal)
        }else {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
            isStarted = true
            startStopButton.setTitle("Stop", for: .normal)
        }
    }
    
    @IBAction func resetTouched(_ sender: UIButton) {
        counter = 0.0
        timerLabel.text = "0.0"
        
        if isStarted {
            timer?.invalidate()
            startStopButton.setTitle("Start", for: .normal)
            isStarted = false
        }
    }
}

