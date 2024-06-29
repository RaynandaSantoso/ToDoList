//
//  ToDoListitemsViewViewModel.swift
//  Todo-list-app
//
//  Created by Raynanda on 07/06/24.
//

// View model for a SINGLE to do list item view (each row in items list).
import FirebaseAuth
import FirebaseFirestore
import Foundation
class ToDoListitemsViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListitem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
     
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}

