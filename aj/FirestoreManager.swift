//
//  FirestoreManager.swift
//  aj
//
//  Created by Ab Shotal on 22/08/2024.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseStorage

class FirestoreManager: ObservableObject {
    private var db = Firestore.firestore()
    private var storage = Storage.storage()

    func addItem(name: String, price: Double, photo: UIImage, completion: @escaping (Error?) -> Void) {
        guard let imageData = photo.jpegData(compressionQuality: 0.8) else {
            completion(NSError(domain: "ImageConversionError", code: -1, userInfo: nil))
            return
        }

        let photoID = UUID().uuidString
        let storageRef = storage.reference().child("images/\(photoID).jpg")

        storageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                completion(error)
                return
            }

            storageRef.downloadURL { url, error in
                if let error = error {
                    completion(error)
                    return
                }

                guard let photoURL = url else {
                    completion(NSError(domain: "PhotoDownloadError", code: -1, userInfo: nil))
                    return
                }

                self.db.collection("items").addDocument(data: [
                    "name": name,
                    "price": price,
                    "photoURL": photoURL.absoluteString
                ]) { error in
                    completion(error)
                }
            }
        }
    }
}

