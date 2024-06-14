//
//  CountdownController.swift
//  dumb-project
//
//  Created by Magistra Apta on 14/06/24.
//

import Foundation
import Combine

class TimerController: ObservableObject {
    
    @Published var timeString: String = "00:00:00"
    var timerSubscription: AnyCancellable?
    var endTime: Date?
    var countdownDuration: TimeInterval
    var remainingTime: TimeInterval?
    var isPaused: Bool = false
        
    init(countdownDuration: TimeInterval) {
        self.countdownDuration = countdownDuration
        self.remainingTime = countdownDuration
        updateTimeString()
    }

    func startCountdown() {
        guard let remainingTime else { return }
        endTime = Date().addingTimeInterval(remainingTime)
        timerSubscription = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateTime()
            }
        isPaused = false
    }
    
    func continueCountdown(){
        guard isPaused else { return }
        startCountdown()
        isPaused = false
    }
    
    func setCountdownDuration(_ duration: TimeInterval){
        self.countdownDuration = duration
        self.remainingTime = duration
        updateTimeString()
    }
    

    func updateTime() {
        guard let endTime = endTime else { return }
        let currentTime = Date()
        let remainingTime = endTime.timeIntervalSince(currentTime)
        
        if remainingTime <= 0 {
            timeString = "00:00:00"
            stopCountdown()
            return
        }
        
        self.remainingTime = remainingTime
        updateTimeString()
    }
    
    func stopCountdown() {
        
        timerSubscription?.cancel()
        timerSubscription = nil
        isPaused = true
    }
    
    func updateTimeString() {
        guard let remainingTime = remainingTime else {return}
        let hours = Int(remainingTime) / 3600
        let minutes = (Int(remainingTime) % 3600) / 60
        let seconds = Int(remainingTime) % 60
        timeString = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
