//
//  AddTaskView.swift
//  Notoro
//
//  Created by Raj Singh on 14/05/25.
//


import SwiftUI

struct AddTaskView:View{
    @State var taskName = ""
    @State var taskType:TaskType = .important
    @FocusState var isFocused: Bool
    @Binding var isPresented: Bool
    @EnvironmentObject var taskList:TaskList

    var body:some View{
        
        VStack {
            
            HStack{
                Image(systemName: "circle")
                ZStack(alignment: .leading) {
                    if taskName.isEmpty {
                        Text("Add a Task")
                            .foregroundStyle(.secondary)
                    }
                    
                    TextField("", text: $taskName)
                        .foregroundStyle(.primary)
                        .focused($isFocused)
                        
                        .onSubmit {
                            if(!taskName.isEmpty){
                                taskList.addTask(task: NTask(name: taskName, description: "", taskType: taskType))
                            }
                            
                           
                                isFocused = false
                            DispatchQueue.main.asyncAfter(deadline: .now()+0.3){
                                isPresented = false
                            }
                            
                                
                            
                        }
                }
                
            }
            .padding()
            
            Picker("Task Type", selection: $taskType) {
                ForEach(TaskType.allCases, id: \.rawValue) { type in
                    Label("\(type)", systemImage: "circle").tag(type)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .background(Color(.background))
        .ignoresSafeArea(edges: .bottom)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.36){
                isFocused = true
            }

        }

    }
}

#Preview {
    AddTaskView(isPresented: .constant(false))
}


