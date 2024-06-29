//
//  ContentView.swift
//  Todo-list-app
//
//  Created by Raynanda on 05/06/24.
//
import Firebase
import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                    
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                    
                }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
}
