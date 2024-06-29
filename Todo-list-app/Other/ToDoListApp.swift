//
//  ToDoListApp.swift
//  Todo-list-app
//
//  Created by Raynanda on 16/06/24.
//
import Firebase
import FirebaseCore
import SwiftUI

@main
 struct Todo_list_App: App {
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

