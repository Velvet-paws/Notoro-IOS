//
//  HomeView.swift
//  Notoro
//
//  Created by Raj Singh on 11/05/25.
//


import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            
            VStack{
                Spacer()
                Image(systemName: "document.fill")
                    .resizable()
                    .foregroundStyle(.accent)
                    .scaledToFit()
                    .frame(height: 72)
                    .padding()
                
                Text("Notoro")
                    .font(.title2)
                    .bold()
                
                Text("Make your life streamlined")
                    .font(.callout)
                    .fontWeight(.light)
                
                
                Rectangle()
                    .frame(width: 240,height: 3)
                
                VStack(spacing:12) {
                    
                    
                    NButton(text: "Show Tasks"){
                        TaskListView()
                    }
                    
                    NButton(text: "Favorites"){
                        FavoritesView()
                    }
                    NButton(text:"Settings"){
                        SettingScreen()
                    }
                }
                Spacer()
                Text("Created in memories of neko 😸")
                    .padding(.bottom,16)
                  
            }
        }
    }
}


#Preview {
    HomeView()
}
