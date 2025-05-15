//
//  TaskList.swift
//  Notoro
//
//  Created by Raj Singh on 15/05/25.
//

import SwiftUI
class TaskList :ObservableObject{
    @Published var tasks:[NTask] = []
    
    func addTask(task:NTask){
        tasks.append(task)
    }
    func deleteTask(offset:IndexSet){
        tasks.remove(atOffsets: offset)
    }
    
    func getFavorites()->[NTask]{
        tasks.filter { task in
            task.isFavorite
        }
    }
    
    func clearFavorites() {
        for task in tasks{
            if(task.isFavorite)
            {
                task.toggleFavorite()
            }
        }
    }
    
    func clearTasks(){
        tasks = []
    }
    
}
