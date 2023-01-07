//
//  Logic.swift
//  Tipsy
//
//  Created by Олександр Федоренко on 07.01.2023.
//

import Foundation

class MainLogic {

    func getBillValue(billTextField: String) -> Float{
        var tmp: Float = 0.0
        if billTextField.isEmpty == true{
            tmp = 0.0
            //please enter something
        }else{
            tmp = Float(billTextField)!
        }
        return tmp
    }

    func selectedTip(index: Int) -> Float {
        switch index{
            case 0:
                return 0.0
            case 1:
                return 10.0
            case 2:
                return 20.0
        default:
            return 0.0
        }
    }

    func selectedSplit (stepperValue: Double) -> Float {
        let tmpSplit: Float = Float(stepperValue)
        return tmpSplit
    }

    func calculate(billValue: Float, tipValue: Float, splitValue: Float) -> Float {
        print("bill - \(billValue)")
        print("tip - \(tipValue)")
        print("split - \(splitValue)")
        let result  = (billValue + ((billValue / 100) * tipValue)) / splitValue
        return result
    }
}
