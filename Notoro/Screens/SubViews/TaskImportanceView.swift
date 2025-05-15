//
//  TaskImportanceView.swift
//  Notoro
//
//  Created by Raj Singh on 15/05/25.
//


import SwiftUI

struct TaskImportanceView: View {
    var type: TaskType
    var body: some View {
        HStack{
            Image(systemName: type.rawValue)
                .imageScale(.large)
            
            Text("\(type)".capitalized)
        }
    }
}

