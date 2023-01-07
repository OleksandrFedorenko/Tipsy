//
//  ViewController.swift
//  Tipsy
//
//  Created by Олександр Федоренко on 06.01.2023.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var selectTipControl: UISegmentedControl!
    @IBOutlet weak var chooseSplitStepper: UIStepper!
    @IBOutlet weak var chooseSplitNumber: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    
    var billValue: Float?
    var tipValue: Float?
    var splitValue: Float?
    var result: Float?

    

    func selectedTip() -> Float {
        switch selectTipControl.selectedSegmentIndex{
            case 0:
                return 0.0
            case 1:
                return 10.0
            case 2:
                return 20.0
        default:
            return 0
        }
    }
    func selectedSplit () -> Float {
        return Float(chooseSplitStepper.value)
    }
    
    func calculate(billValue: Float, tipValue: Float, splitValue: Float) -> Float {
        let result  = (billValue + (billValue / 100 * tipValue)) / splitValue
        return result
    }

    @IBAction func valueChangedStepper(_ sender: UIStepper) {
        chooseSplitNumber.text = String(format: "%.f", chooseSplitStepper.value)
    }
    
    @IBAction func calculateBill(_ sender: UIButton) {
        billValue = Float(billTextField.text!)
        tipValue = selectedTip()
        splitValue = selectedSplit()
        result = calculate(billValue: billValue!, tipValue: tipValue!, splitValue: splitValue!)
        print(result)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
