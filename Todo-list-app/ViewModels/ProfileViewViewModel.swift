import SwiftUI
import Firebase

class ProfileViewViewModel: ObservableObject {
    @Published var user: User? = nil
    @Published var isLoading = true
    
    init() {
        fetchUser()
    }
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            if let error = error {
                print("Error fetching user: \(error.localizedDescription)")
                self?.isLoading = false
                return
            }
            guard let data = snapshot?.data() else {
                print("No user data found")
                self?.isLoading = false
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(id: data["id"] as? String ?? "",
                                  name: data["name"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  joined: data["joined"] as? TimeInterval ?? 0)
                self?.isLoading = false
            }
        }
    }
    func logOut() {
            do {
                try Auth.auth().signOut()
            } catch {
                print("Error signing out: \(error.localizedDescription)")
            }
        }
}

