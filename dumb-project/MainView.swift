//
//  MainView.swift
//  dumb-project
//
//  Created by Magistra Apta on 13/06/24.
//

import SwiftUI
import Combine


struct TaskItem: Identifiable {
    let id = UUID()
    var taskName: String
}


struct MainView: View {
    
    var taskList = [
        TaskItem(taskName: "coding"),
        TaskItem(taskName: "cooking")
    ]
    
    @State var textField: String = ""
    
    var time: TimeInterval = 450
    @ObservedObject var timerController = TimerController(countdownDuration: 1500)
    
    var body: some View {
        VStack (spacing: 12){
            
            Text(timerController.timeString)
                .font(.system(size: 56))
            
            optionTimer
            
            timerActionButton
            Spacer()
            TextField("Add new task", text: $textField)
                .textFieldStyle(.roundedBorder)
                .frame(width: 340)
            
            Button {
                //
            } label: {
                HStack{
                    Text("Add Task")
                        .foregroundColor(.white)
                        .bold()
                    
                    Image(systemName: "plus.circle.fill")
                        .tint(.green)
                }
                .shadow(radius: 3)
            }
            .padding()
            .frame(width: 340)
            .background(Color.blue)
            .cornerRadius(8)
            
            List(taskList) { list in
                Text(list.taskName)
            }
            .listStyle(.plain)

        }
    }
    
    private var timerActionButton: some View {
        HStack {
            Button {
                timerController.startCountdown()
            } label: {
                Text("Start")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                   
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            
        
            Button {
                timerController.stopCountdown()
            } label: {
                Text("Stop")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.red)
            .cornerRadius(10)
        }
        .frame(width: 340)
    }
    
    private var optionTimer: some View {
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


