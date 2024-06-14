//
//  MainView.swift
//  dumb-project
//
//  Created by Magistra Apta on 13/06/24.
//

import SwiftUI
import Combine


struct MainView: View {
    var time: TimeInterval = 450
    @ObservedObject var timerController = TimerController(countdownDuration: 1500)
    var body: some View {
        VStack (spacing: 12){
            
            Text(timerController.timeString)
                .font(.system(size: 48))
            HStack {
                Button {
                    timerController.startCountdown()
                } label: {
                    Text("Start")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                    
                }
            
                Button {
                    timerController.stopCountdown()
                } label: {
                    Text("Stop")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            
            // select time button
            HStack {
                Button {
                    timerController.setCountdownDuration(300)
                } label: {
                    Text("5m")
                        .foregroundColor(.red)
                        .padding()
                }
                
                Button {
                    timerController.setCountdownDuration(600)
                } label: {
                    Text("10m")
                        .foregroundColor(.red)
                        .padding()
                }
                
                Button {
                    timerController.setCountdownDuration(1500)
                } label: {
                    Text("25m")
                        .foregroundColor(.red)
                        .padding()
                }
            }
            
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


