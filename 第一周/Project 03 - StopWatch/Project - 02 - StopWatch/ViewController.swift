//
//  ViewController.swift
//  Project - 02 - StopWatch
//
//  Created by cqmlwlkj on 2017/10/15.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    var time = 0.0
    var flag = false
    
    let timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global()
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTimer()
    }

    @IBAction func resetTime(_ sender: Any) {
        
        if flag == true {
            timer.suspend()
            flag = false
        } else {
            flag = false
        }
        
        self.time = 0.0
        self.timeLabel.text = String(format: "%0.1f", self.time)
        
    }

    @IBAction func timingStart(_ sender: Any) {
        if flag == false {
            timer.resume()
            flag = true
        }
    }
    @IBAction func timingPaused(_ sender: Any) {
        if flag == true {
            timer.suspend()
            flag = false
        }
    }
    
    private func setupTimer() {
        
        timer.scheduleRepeating(deadline: .now(), interval: .milliseconds(100))
        timer.setEventHandler { [weak self] in
            
            self?.time += 0.1
            DispatchQueue.main.async {
                self?.timeLabel.text = String(format: "%0.1f", (self?.time) ?? 0.0)
            }
            print(self?.time ?? "nil")
        }
    }
}

