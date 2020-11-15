//
//  ViewController.swift
//  StopGame
//
//  Created by 谷風汰 on 2020/11/02.
//  Copyright © 2020 Futa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
  
    @IBOutlet weak var timerDisplay: UILabel!
    
    
       var countNum = 0
       var timerRunning = false
       var timer = Timer()
    
    
    
    @objc func updateDisplay(){
        countNum += 1
        let ms = countNum % 100
        let s = (countNum - ms) / 100 % 60
        let m = (countNum - s - ms) / 6000 % 3600
        timerDisplay.text = String(format: "%02d:%02d.%02d", m,s,ms)
    }
    
    
    @IBAction func StartButton(_ sender: Any) {
        if timerRunning == false{
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.updateDisplay), userInfo: nil, repeats: true)
            timerRunning = true
        }
    }
    
    
    
    @IBAction func StopButton(_ sender: Any) {
        if timerRunning == true{
            timer.invalidate()
            timerRunning = false
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:0.9,green:1.0,blue:0.9,alpha:1.0)
        
        
    }


}

