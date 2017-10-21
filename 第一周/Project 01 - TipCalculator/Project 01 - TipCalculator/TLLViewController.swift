//
//  TLLViewController.swift
//  Project 01 - TipCalculator
//
//  Created by cqmlwlkj on 2017/10/12.
//  Copyright © 2017年 TongRy. All rights reserved.
//

import UIKit

class TLLViewController: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentageSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inputText.inputAccessoryView = addToolBar()
        inputText.keyboardType = .decimalPad
    }
    
    @IBAction func sliderValueChange(_ sender: Any) {
        
        updateUI()
    }
    
    private func updateUI() {
        
        percentageLabel.text = String(format: "Tip(%%%d)", getPercentage())
        tipLabel.text = String(format: "$%0.2f", calculatedTipValue())
        totalLabel.text = String(format: "$%0.2f", calculatedTotalValue())
    }
    
    private func calculatedTipValue() -> Double {
        
        guard let money = inputText.text else {
                print("money 为nil")
                return 0.00
        }
        
        let moneyNum = Double(money)
        let percentageNum = Double(getPercentage()) / 100.0
        let tipValue = (moneyNum ?? 0.0) * percentageNum
        
        return tipValue
    }
    
    private func calculatedTotalValue() -> Double {
        
        guard let money = inputText.text else {
            print("money 为nil")
            return 0.00
        }
        
        let moneyNum = Double(money)
        let total = (moneyNum ?? 0.0) + calculatedTipValue()
        
        return total
    }
    
    private func getPercentage() -> Int {
        
        let percentage = Int(percentageSlider.value)
        return percentage
    }
    
    private func addToolBar() -> UIToolbar {
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 35))
        toolBar.backgroundColor = UIColor.white
        // 设置左边一个按钮，把完成按钮顶到右边
        let spaceBtn = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        // 不知道为什么必须设置宽度，不然顶不过去
        spaceBtn.width = self.view.frame.size.width - 60.0
        let completeBtn = UIBarButtonItem(title: "完成", style: .plain, target: self, action: #selector(doneCalculate))
        
        toolBar.setItems([spaceBtn, completeBtn], animated: true)
        toolBar.sizeToFit()
        
        return toolBar
    }
    
    func doneCalculate() {
        
        updateUI()
        inputText.endEditing(true)
    }
    
    // 点击空白 收回键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        inputText.endEditing(true)
    }
    
}
