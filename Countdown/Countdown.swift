//
//  Countdown.swift
//  Countdown
//
//  Created by Jeffrey Carpenter on 5/1/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import Foundation

protocol CountdownDelegete: AnyObject {
    func countdownDidUpdate(timeRemaining: TimeInterval)
    func countdownDidFinish()
}

class Countdown {
    
    var timer: Timer?
    var startDate: Date?
    var stopDate: Date?
    var timeRemaining: TimeInterval
    var duration: TimeInterval?
    weak var delegate: CountdownDelegete?
    
    // MARK: - Methods
    init(duration: TimeInterval = 60) {
        self.duration = duration
        self.timeRemaining = duration
    }
    
    // Start
    func start(duration: TimeInterval) {
        
        self.duration = duration
        self.timeRemaining = duration
        stopDate = Date(timeIntervalSinceNow: duration)
        
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(update(timer:)), userInfo: nil, repeats: true)
    }
    
    // Stop
    func stop() {
        
        stopDate = nil
        clearTimer()
    }
    
    // Reset
    func reset() {
        
        clearTimer()
        stopDate = nil
        timeRemaining = 0
    }
    
    // Update timer
    @objc func update(timer: Timer) {
        
        // Calculate timeRemaining (stopDate - currentTime)
        if let stopDate = stopDate {
            
            let currentTime = Date()
            
            if currentTime <= stopDate {
                timeRemaining = stopDate.timeIntervalSince(currentTime)
            } else {
                reset()
                delegate?.countdownDidFinish()
            }

            delegate?.countdownDidUpdate(timeRemaining: timeRemaining)
        }
    }
    
    private func clearTimer() {
        timer?.invalidate()
        timer = nil
    }
}
