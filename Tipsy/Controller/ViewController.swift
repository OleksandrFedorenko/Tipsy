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
    var splitValue: Float = 0.0
    var result: Float?

    
    
    func getBillValue(){
        if billTextField.text?.isEmpty == true{
            billValue = 0.0
            //please enter something
        }else{
            billValue = Float(billTextField.text!)
        }
    }
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
        getBillValue()
        tipValue = selectedTip()
        splitValue = selectedSplit()
        result = calculate(billValue: billValue!, tipValue: tipValue!, splitValue: splitValue)
        self.performSegue(withIdentifier: "goToSecond", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecond"{
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.result = String(result!)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
