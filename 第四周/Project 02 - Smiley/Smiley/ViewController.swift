//
//  ViewController.swift
//  Smiley
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

    var leftLayer:CALayer!
    var rightLayer:CALayer!
    let bLayer = CALayer()
    
    var leftAnimation:CAAnimationGroup!
    var rightAnimation:CAAnimationGroup!
    var bAnimation = CAAnimationGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        leftLayer.add(leftAnimation, forKey: "group")
        rightLayer.add(rightAnimation, forKey: "group")
        bLayer.add(bAnimation, forKey: "position")
    }
    
    func createUI()
    {
        
        leftLayer = createLayer(position: CGPoint(x: 30, y: 95),color:UIColor.cyan.cgColor)
        rightLayer = createLayer(position: CGPoint(x: SCW - 120, y: 95),color:UIColor.yellow.cgColor)
        
        leftAnimation = createGroup(values: [NSValue.init(cgPoint: CGPoint(x: 30, y: 95)),NSValue.init(cgPoint: CGPoint(x: 50, y: 120)),NSValue.init(cgPoint: CGPoint(x: 30, y: 120)),NSValue.init(cgPoint: CGPoint(x: 35, y: 120))], fromColor: UIColor.cyan.cgColor, toColor: UIColor.yellow.cgColor)
        rightAnimation = createGroup(values: [NSValue.init(cgPoint: CGPoint(x: SCW - 130, y: 95)),NSValue.init(cgPoint: CGPoint(x: SCW - 150, y: 120)),NSValue.init(cgPoint: CGPoint(x: SCW - 130, y: 120)),NSValue.init(cgPoint: CGPoint(x: SCW - 135, y: 120))], fromColor: UIColor.yellow.cgColor, toColor: UIColor.cyan.cgColor)
        
        bLayer.anchorPoint = CGPoint(x: 0, y: 0)
        bLayer.position = CGPoint(x: 80, y: 230)
        bLayer.bounds = CGRect(x: 0, y: 0, width: SCW - 160, height: 50)
        bLayer.backgroundColor = UIColor.lightGray.cgColor
        view.layer.addSublayer(bLayer)
        
        createBGroup()
        
    }
    
    func createBGroup() {
        let sizeAni = CAKeyframeAnimation.init(keyPath: "bounds.size")
        sizeAni.values = [NSValue.init(cgSize:CGSize(width: SCW - 160, height: 50)), NSValue.init(cgSize:CGSize(width: SCW - 160, height: 135)),NSValue.init(cgSize:CGSize(width: SCW - 160, height: 125)),NSValue.init(cgSize:CGSize(width: SCW - 160, height: 135))]
        sizeAni.duration = 0.4
        sizeAni.isRemovedOnCompletion = false
        sizeAni.fillMode = kCAFillModeForwards
        
        let positionAni = CABasicAnimation(keyPath: "position")
        positionAni.duration = 0.8
        positionAni.fillMode = kCAFillModeForwards
        positionAni.fromValue = CGPoint(x: 80, y: 230)
        positionAni.toValue = CGPoint(x: 80, y: 255)
        
        //        bAnimation.duration = 0.6
        bAnimation.isRemovedOnCompletion = false
        bAnimation.fillMode = kCAFillModeForwards
        bAnimation.animations = [sizeAni,positionAni]
        
    }
    
    func createLayer(position:CGPoint,color:CGColor) -> CALayer {
        
        let layer = CALayer()
        layer.anchorPoint = CGPoint(x: 0, y: 0)
        layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        layer.position = position
        layer.backgroundColor = color
        view.layer.addSublayer(layer)
        
        return layer
    }
    
    
    func createGroup(values:[NSValue],fromColor:CGColor,toColor:CGColor) -> CAAnimationGroup
    {
        let group = CAAnimationGroup()
        
        let positionAni = CAKeyframeAnimation.init(keyPath: "position")
        positionAni.values = values
        positionAni.duration = 0.6
        positionAni.isRemovedOnCompletion = false
        positionAni.fillMode = kCAFillModeForwards
        
        let colorAni = CABasicAnimation(keyPath: "backgroundColor")
        colorAni.fromValue = fromColor
        colorAni.toValue = toColor
        colorAni.duration = 0.6
        colorAni.fillMode = kCAFillModeForwards
        
        
        group.duration = 0.6
        group.fillMode = kCAFillModeForwards
        group.isRemovedOnCompletion = false
        group.animations = [positionAni,colorAni]
        
        
        return group
    }


}

