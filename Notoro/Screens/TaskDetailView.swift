//
//  TaskDetailView.swift
//  Notoro
//
//  Created by Raj Singh on 15/05/25.
//

import SwiftUI

struct TaskDetailView: View {
    @StateObject var task:NTask
    @State var taskName:String = ""
    @State var taskDescription = ""
    @State var taskType = TaskType.important
    var body: some View {
        VStack{
            HStack(spacing:16){
                Image(systemName: "circle")
                    .imageScale(.large)
                TextField("",text: $taskName)
                    .font(.title3)
                Spacer()
                Button {
                    task.toggleFavorite()
                } label: {
                    Image(systemName: task.isFavorite ?"star.fill":"star")
                        .imageScale(.large)
                }
            }
            .padding()
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color(.accent),lineWidth: 1.5)
                    .frame(height: 240)
                    .overlay {
                        TextEditor(text: $taskDescription)
                            .textEditorStyle(.plain)
                            .font(.callout)
                            .padding(2)
                    }
               
            }
            .padding()
            
            
            HStack {
                Picker("Type", selection: $taskType
                ) {
                    ForEach(TaskType.allCases,id: \.rawValue) { type in
                        TaskImportanceView(type: type)
                            .tag(type)
                    }
                }

                
               
                Spacer()
                Text("Created on \(task.createdAt.formate)")
                
            }
            .padding(.horizontal)
            
            Spacer()
            Button {
                task.name = taskName
                task.description = taskDescription
                task.taskType = taskType
            } label: {
                Label("Update", systemImage: "square.and.pencil")
                    .font(.title3)
                    .foregroundStyle(Color(.label))

                   
                   
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(.accent)
            .padding(.bottom,32)
            

            
            
        }
        .onAppear{
            taskName = task.name
            taskDescription = task.description
            taskType = task.taskType
        }
        .navigationTitle("Details")
    }
}

#Preview {
    NavigationView {
        TaskDetailView(task: NTask.sampleTask)
    }
}
