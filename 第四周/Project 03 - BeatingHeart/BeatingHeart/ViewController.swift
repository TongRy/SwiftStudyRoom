//
//  ViewController.swift
//  BeatingHeart
//
//  Created by cqmlwlkj on 2017/11/12.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

//屏幕宽、高、bounds
let SCW = UIScreen.main.bounds.width
let SCH = UIScreen.main.bounds.height
let gBOUNDS = UIScreen.main.bounds

class ViewController: UIViewController {

    var heartImg:UIImageView = UIImageView(frame: CGRect(x: SCW/2 - 45, y: 100, width: 90, height: 90))
    
    var img:UIImageView = UIImageView(frame: CGRect(x: SCW/2 - 120, y: 230, width: 240, height: 240))
    
    let hiddenAni = CABasicAnimation(keyPath: "opacity")
    
    let heartAnimation = CABasicAnimation(keyPath: "transform.scale")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        
        perform(#selector(hiddenAniAnimation), with: self, afterDelay: 3.0)
    }

    override func viewWillAppear(_ animated: Bool) {
        heartImg.layer.add(heartAnimation, forKey: "transform.scale")
    }
    
    @objc func hiddenAniAnimation() {
        img.layer.add(hiddenAni, forKey: "opacity")
    }
    
    func createUI()
    {
        heartImg.image = UIImage(named: "heartAni")
        view.addSubview(heartImg)
        
        heartAnimation.duration = 0.3
        heartAnimation.toValue = 1.1
        heartAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        heartAnimation.autoreverses = true
        heartAnimation.repeatCount = .greatestFiniteMagnitude
        heartImg.layer.add(heartAnimation, forKey: "transform.scale")
        
        img.image = UIImage(named: "richu.jpg")
        view.addSubview(img)
        hiddenAni.duration = 3
        hiddenAni.fromValue = 1
        hiddenAni.toValue = 0
        hiddenAni.isRemovedOnCompletion = false
        hiddenAni.fillMode = kCAFillModeForwards
    }
   


}

