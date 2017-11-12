//
//  AppDelegate.swift
//  Twitter
//
//  Created by cqmlwlkj on 2017/11/12.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mask: CALayer?
    var imageView: UIImageView?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            
            // 添加背景图片
            imageView = UIImageView(frame: window.frame)
            imageView?.image = UIImage(named: "twitter")
            window.addSubview(imageView!)
            
            // 设置遮罩层 mask
            mask = CALayer()
            mask?.contents = UIImage(named: "twitter logo mask")?.cgImage
            mask?.position = window.center
            mask?.bounds = CGRect(x: 0, y: 0, width: 100, height: 80)
            imageView?.layer.mask = mask
            
            animateMask()
            
            // 设置根控制器，使 window 可见
            window.rootViewController = ViewController()
            window.backgroundColor = UIColor(red: 70/255, green: 154/255, blue: 233/255, alpha: 1)
            window.makeKeyAndVisible()
        }
        
        return true
    }

    func animateMask() {
        
        // 初始化 CAKeyframeAnimation
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 1
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 1
        
        // 关键帧动画的数组
        let initalBounds = NSValue(cgRect: (mask?.bounds)!)
        let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 80, height: 64))
        let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 2000, height: 2000))
        keyFrameAnimation.values = [initalBounds, secondBounds, finalBounds]
        
        // 设置时间间隔
        keyFrameAnimation.keyTimes = [0, 0.3, 1]
        
        // 给当前 view 添加动画
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
        mask?.add(keyFrameAnimation, forKey: "bounds")
    }

}

extension AppDelegate: CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        imageView?.layer.mask = nil   // 清除遮罩层
    }
}

