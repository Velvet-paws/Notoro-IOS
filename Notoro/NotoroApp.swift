//
//  NotoroApp.swift
//  Notoro
//
//  Created by Raj Singh on 11/05/25.
//

import SwiftUI

@main
struct NotoroApp: App {
   
    @Environment(\.colorScheme) private var colorScheme
    private var taskList = TaskList()
    var setting = Setting()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(setting)
                .environmentObject(taskList)
            
                .onAppear {
                    setting.colorScheme = colorScheme
                }
        }
    }
}
