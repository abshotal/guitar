import Firebase
import FirebaseFirestore

class FirestoreManager: ObservableObject {
    private let db = Firestore.firestore()

    func addItem(name: String, price: Double, imageUrl: String, completion: @escaping (Error?) -> Void) {
        let newItem: [String: Any] = [
            "name": name,
            "price": price,
            "imageUrl": imageUrl // Use String type for image URL
        ]
        
        db.collection("items").addDocument(data: newItem) { error in
            completion(error)
        }
    }
}
