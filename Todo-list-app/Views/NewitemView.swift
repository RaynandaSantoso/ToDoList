//
//  NewitemView.swift
//  Todo-list-app
//
//  Created by Raynanda on 07/06/24.
//

import SwiftUI

struct NewitemView: View {
    @StateObject var viewModel = NewitemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                // Title
                TextField("Name", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // Due date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                // Button
                TLButton(title: "Save",
                         background: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                         .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields and select due date that is newer than today."))
            }
            
        }
    }
}

#Preview {
    NewitemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
