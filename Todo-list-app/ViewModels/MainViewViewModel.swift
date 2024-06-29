//
//  MainViewViewModel.swift
//  Todo-list-app
//
//  Created by Raynanda on 07/06/24.
//
import Firebase
import FirebaseAuth
import Foundation

import SwiftUI


class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    @Published var isSignedIn: Bool = false
    private var handler: AuthStateDidChangeListenerHandle?

    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
                self?.isSignedIn = user != nil
            }
        }
    }
}
