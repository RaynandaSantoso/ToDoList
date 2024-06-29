//
//  ProfileView.swift
//  Todo-list-app
//
//  Created by Raynanda on 07/06/24.
//
import Firebase
import FirebaseAuth
import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel  = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
            }
        .onAppear {
            viewModel.fetchUser()
        }
        }
    @ViewBuilder
    func profile(user: User) -> some View {
        //Profile picture
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        //Info: Name, Email, Member since
        VStack(alignment: .leading) {
                HStack {
                    Text("Name: ")
                        .bold()
                    Text(user.name)
                }
                .padding()
                HStack {
                    Text("Email: ")
                        .bold()
                    Text(user.email)
                }
                .padding()
                HStack {
                    Text("Member Since: ")
                        .bold()
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date:.abbreviated, time: .shortened))")
                }
                .padding()
            }
        
        
        // Sign out
        
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        
        Spacer()
    }
    }

func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
