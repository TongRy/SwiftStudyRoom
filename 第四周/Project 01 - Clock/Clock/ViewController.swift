//
//  ViewController.swift
//  Clock
//
//  Created by cqmlwlkj on 2017/11/6.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var clockBgView: UIView!
    
    // MARK:  懒加载
    // 时针
    lazy var hourHand: UIView = { () -> UIView in
        let hour = UIView()
        hour.bounds = CGRect(x: 0, y: 0, width: 4, height: 50)
        hour.backgroundColor = UIColor.darkGray
        hour.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9)
        return hour
    }()
    
    // 分针
    lazy var minuteHand: UIView = { () -> UIView in
        let minute = UIView()
        minute.bounds = CGRect(x: 0, y: 0, width: 3, height: 70)
        minute.backgroundColor = UIColor.darkGray
        minute.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9)
        return minute
    }()
    
    // 秒针
    lazy var secondHand: UIView = { () -> UIView in
        let second = UIView()
        second.bounds = CGRect(x: 0, y: 0, width: 2, height: 85)
        second.backgroundColor = UIColor.red
        second.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9)
        return second
    }()
    
    // 通过时区获取时间 计算型属性
    var currentTime: DateComponents {
        
        // 获取日历
        let calendar = Calendar(identifier: .gregorian)
        
        // 获取系统当前时间
        let currentDate = Date()
        
        // 取出当前的时分秒
        let times = calendar.dateComponents([.second , .minute , .hour], from: currentDate)
        
        return times;
     }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置寄宿图 -> 背景
        clockBgView.layer.contents = UIImage(named: "clock")?.cgImage
        
        setupUI()
        
        
    }

    fileprivate func setupUI() {
        // 萌帅说用 CADisplayLink 比 timer 好一点
        let link = CADisplayLink(target: self, selector: #selector(runTime))
        link.add(to: RunLoop.main, forMode: .commonModes)
        
        view.addSubview(hourHand)
        hourHand.center = view.center

        view.addSubview(minuteHand)
        minuteHand.center = view.center
        
        view.addSubview(secondHand)
        secondHand.center = view.center
        
    }
    
    // 让钟表转动起来
    @objc fileprivate func runTime() {
        
        let angle = Float((currentTime.second)!) * (.pi * 2.0 / 60.0)
        secondHand.transform = CGAffineTransform(rotationAngle: CGFloat(angle))

        let minuteAngle = Float((currentTime.minute)!) * (.pi * 2.0 / 60.0)
        minuteHand.transform = CGAffineTransform(rotationAngle: CGFloat(minuteAngle))

        let hourAngle = Float((currentTime.hour)!) * (.pi * 2.0 / 12.0);
        hourHand.transform = CGAffineTransform(rotationAngle: CGFloat(hourAngle))
    }
    
}

