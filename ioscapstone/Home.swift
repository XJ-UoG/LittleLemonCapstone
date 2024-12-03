//
//  ContentView.swift
//  ioscapstone
//
//  Created by Tan Xin Jie on 3/12/24.
//

import SwiftUI
import CoreData

struct Home: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    let persistence = PersistenceController.shared
    
    var body: some View {
        NavigationView {
            TabView {
                VStack {
                    Hero()
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    Menu()
                }
                    .tabItem {
                        Label("Menu", systemImage: "list.dash")
                }
                UserProfile()
                    .tabItem {
                        Label("Profile", systemImage: "square.and.pencil")
                    }
            }
            .environment(\.managedObjectContext, persistence.container.viewContext)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image("LittleLemonHeader")
                    .resizable()
                    .scaledToFit()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    Home().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}

struct Hero: View {
    var body: some View {
        ZStack {
            Color.green
            HStack {
                Spacer()
                Color.red
                    .frame(width: 120, height: 120)
                    .cornerRadius(15)
            }
            .padding()
            VStack (alignment: .leading) {
                HStack {
                    Text("Little Lemon")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.yellow)
                    Spacer()
                }
                Text("Chicago")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                    .font(.body)
                    .foregroundColor(.white)
                    .frame(width: 200)
                Spacer()
            }
            .padding()
        }
        .frame(height: 250)
    }
}
