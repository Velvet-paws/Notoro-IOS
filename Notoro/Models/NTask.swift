//
//  Task.swift
//  Notoro
//
//  Created by Raj Singh on 12/05/25.
//

import Foundation
enum TaskType:String,CaseIterable{
    case important  = "star.circle"
    case moderate    = "shield.pattern.checkered"
    case inessential = "person.slash.fill"
}

class NTask:ObservableObject,Identifiable {
    
    @Published var name: String
    @Published var description: String
    @Published var taskType: TaskType
    
    let createdAt: Date
    
    @Published private(set) var isFavorite = false
    
    
    
    init(name: String, description: String, taskType: TaskType) {
        self.name = name
        self.description = description
        self.taskType = taskType
        self.createdAt = Date.now
    }
    
    func toggleFavorite(){
        isFavorite.toggle()
    }
    
    
    static let sampleTask = NTask(name: "Sample", description: "sAMPLE dESCRIPTION", taskType: .inessential)
    static let sampleTask2 = NTask(name: "Samplegtg", description: "sAMPLE dESCRIPTION", taskType: .moderate)
    static let sampleTask3 = NTask(name: "Samplefgg", description: "sAMPLE dESCRfsgsgsgIPTION", taskType: .inessential)
    static let sampleTaskList =  [sampleTask,sampleTask2,sampleTask3]
}




