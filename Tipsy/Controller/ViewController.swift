//
//  ViewController.swift
//  Tipsy
//
//  Created by Олександр Федоренко on 06.01.2023.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var selectTipControl: UISegmentedControl!
    @IBOutlet weak var chooseSplitStepper: UIStepper!
    @IBOutlet weak var chooseSplitNumber: UILabel!
    @IBOutlet weak var calculateButton: UIButton!

    var logic = MainLogic()
    var value = Value()

    @IBAction func valueChangedStepper(_ sender: UIStepper) {
        chooseSplitNumber.text = String(format: "%.f", chooseSplitStepper.value)
    }

    @IBAction func calculateBill(_ sender: UIButton) {
        value.bill = logic.getBillValue(billTextField: billTextField.text!)
        value.tip = logic.selectedTip(index: selectTipControl.selectedSegmentIndex)
        value.split = logic.selectedSplit(stepperValue: chooseSplitStepper.value)
        value.result = logic.calculate(billValue: value.bill!, tipValue: value.tip!, splitValue: value.split)
        self.performSegue(withIdentifier: "goToSecond", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.billTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecond"{
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.result = value
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
