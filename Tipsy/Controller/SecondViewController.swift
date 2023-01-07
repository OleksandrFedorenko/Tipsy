//
//  SecondViewController.swift
//  Tipsy
//
//  Created by Олександр Федоренко on 06.01.2023.
//

import UIKit
import Foundation

class SecondViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    var result = Value()

    override func viewDidLoad() {
        super.viewDidLoad()
        let tmp1 = Int(result.split)
        let tmp2 = Int(result.tip!)
        resultLabel.text = String(result.result!)
        explainLabel.text = "Split between \(tmp1) people, with \(tmp2)% tip"
        // Do any additional setup after loading the view.
    }
    @IBAction func recalculateButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
