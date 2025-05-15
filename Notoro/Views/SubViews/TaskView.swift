//
//  TaskView.swift
//  Notoro
//
//  Created by Raj Singh on 12/05/25.
//


import SwiftUI

struct TaskView: View {
    @ObservedObject var task :NTask

    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundStyle(Color(.tertiarySystemFill))
            .frame(height: 100)
            .overlay {
                HStack{
                    Image(systemName: task.taskType.rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 36)
                        .foregroundStyle(Color(.accent))
                    
                    VStack(alignment: .leading){
                        Text(task.name)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                           
                        Text(task.createdAt.formate)
                            .font(.title3)
                            .foregroundStyle(.secondary)
                        
                    }.padding(.leading)
                    
                    Spacer()
                    
//                    Button {
//                        task.toggleFavorite()
//                    } label: {
//                        Image(systemName: task.isFavorite ?"star.fill":"star")
//                            .imageScale(.large)
//                    }

                    
                        
                    
                    
                    
                    
                }
                .padding(32)
                
                
                
            }
    }
}

#Preview {
    TaskView(task: NTask.sampleTask)
}
