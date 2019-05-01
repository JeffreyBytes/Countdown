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
    
    lazy var dateFormatter: DateFormatter = {
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm:ss.SS"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.countDownDuration = 60
        countdown.delegate = self
        
        timerLabel.font = UIFont.monospacedDigitSystemFont(ofSize: timerLabel.font.pointSize, weight: .medium)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
        countdown.start(duration: datePicker.countDownDuration)
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
    }
    
    private func updateViews() {
        
        let date = Date(timeIntervalSinceReferenceDate: countdown.timeRemaining)
        timerLabel.text = dateFormatter.string(from: date)
    }

    func showAlert() {
        
        let alert = UIAlertController(title: "Timer Finished!", message: "Your countdown is over", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension CountdownViewController: CountdownDelegete {
    
    func countdownDidUpdate(timeRemaining: TimeInterval) {
        updateViews()
    }
    
    func countdownDidFinish() {
        updateViews()
        showAlert()
    }
}
