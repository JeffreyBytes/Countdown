//
//  CountdownViewController.swift
//  Countdown
//
//  Created by Jeffrey Carpenter on 5/1/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import UIKit

class CountdownViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
    }
}
