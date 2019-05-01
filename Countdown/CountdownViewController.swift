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
    
    let countdown = Countdown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.countDownDuration = 60
        countdown.delegate = self
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        print("Countdown: \(datePicker.countDownDuration)")
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
        countdown.start(duration: datePicker.countDownDuration)
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
    }
    
    private func updateViews() {
        
        timerLabel.text = "\(countdown.timeRemaining)"
    }
}

extension CountdownViewController: CountdownDelegete {
    
    func countdownDidUpdate(timeRemaining: TimeInterval) {
        // update the views
        updateViews()
    }
}
