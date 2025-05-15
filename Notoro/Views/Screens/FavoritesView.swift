//
//  FavoritesView.swift
//  Notoro
//
//  Created by Raj Singh on 11/05/25.
//
import SwiftUI

struct FavoritesView:View{
    @EnvironmentObject var taskList:TaskList
    var body:some View{
        List{
            ForEach(taskList.getFavorites()){ nTask in
                NavigationLink {
                    TaskDetailView(task: nTask)
                } label: {
                    TaskView(task: nTask)
                        .listRowSeparator(.hidden)
                }
                .buttonStyle(PlainButtonStyle())
                .listRowSeparator(.hidden)
            }
            .onDelete { indexSet in
                taskList.deleteTask(offset: indexSet)
            }
            
        }
        .listStyle(.plain)
            .navigationTitle("Favorites")
    }
}


#Preview{
    NavigationView {
        FavoritesView()
    }
}
