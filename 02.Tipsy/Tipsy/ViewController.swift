//
//  ViewController.swift
//  Tipsy
//
//  Created by Kenneth Kang on 15/09/2017.
//  Copyright © 2017 Kenneth Kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitTotalLabel: UILabel!
    
    // create instance of class
    var tip = TipModel(billAmount: 0, tipPercent: 0, split: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        setTipCalculationValues()
        updateUI()
        
    }
    
    func setTipCalculationValues() {
        
        // Slider value is float type so that set it as a double value
        tip.tipPercent = Double(tipPercentSlider.value)
        
        // ! to tell Xcode that we definitely have a value
        // as means to downcast as type 'NSString' which has a property .doubleValue.
        tip.billAmount = ((textField.text)! as NSString).doubleValue
        
        tip.split = Int(splitSlider.value)
        
        tip.calculateTip()
    }
    
    func updateUI() {
        // set text to US currency format ($5.00)
        tipAmountLabel.text = String(format: "$%0.2f", tip.tipAmount)
        totalAmountLabel.text = String(format: "$%0.2f", tip.totalAmount)
        tipPercentLabel.text = "Tip: \(Int(tipPercentSlider.value * 100))%"
        splitLabel.text = "\(Int(splitSlider.value)) Split"
        splitTotalLabel.text = String(format: "$%0.2f", tip.splitTotal)
    }
    

    // MARK: Actions
    @IBAction func billAmountChanged(_ sender: Any) {
        print("My value changed!!")
        setTipCalculationValues()
        updateUI()
    }
    
    @IBAction func tipPercentChanged(_ sender: UISlider) {
        
        // hide keyboard
        view.endEditing(true)
        
        // make slider snappier
        let steps: Float = 100
        let roundedValue = round(sender.value * steps) / steps
        sender.value = roundedValue
        
        setTipCalculationValues()
        updateUI()
    }
    
    @IBAction func splitSliderChanged(_ sender: UISlider) {
        // hide keyboard
        view.endEditing(true)
        
        // make slider snappier
//        let sliderValue = round(sender.value * 1.0) / 1.0
//        sender.value = sliderValue
        
        let sliderValue = Float(Int(sender.value))
        sender.value = sliderValue
        
        setTipCalculationValues()
        updateUI()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // hide keyboard
        view.endEditing(true)
    }
    
}

