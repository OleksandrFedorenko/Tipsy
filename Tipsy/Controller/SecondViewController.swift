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
    var result: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = result
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
