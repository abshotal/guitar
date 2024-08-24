import SwiftUI
import PhotosUI
import FirebaseStorage

struct AddItemView: View {
    @StateObject private var firestoreManager = FirestoreManager()
    @State private var itemName: String = ""
    @State private var itemPrice: String = ""
    @State private var selectedImage: UIImage?
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var showingImagePicker = false

    var body: some View {
        VStack {
            TextField("Enter item name", text: $itemName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Enter item price", text: $itemPrice)
                .padding()
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                showingImagePicker = true
            }) {
                Text("Select Photo")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(selectedImage: $selectedImage)
            }

            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
                    .padding()
            }

            Button(action: {
                addItem()
            }) {
                Text("Add Item")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Message"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .padding()
    }

    private func addItem() {
        guard let price = Double(itemPrice), let image = selectedImage else {
            alertMessage = "Please enter a valid price and select a photo."
            showingAlert = true
            return
        }

        // Convert UIImage to Data
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            alertMessage = "Failed to process image."
            showingAlert = true
            return
        }

        // Define the path for the image in Firebase Storage
        let storageRef = Storage.storage().reference().child("images/\(UUID().uuidString).jpg")

        // Upload the image to Firebase Storage
        storageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                self.alertMessage = "Failed to upload image: \(error.localizedDescription)"
                self.showingAlert = true
                return
            }

            // Retrieve the download URL for the uploaded image
            storageRef.downloadURL { url, error in
                if let error = error {
                    self.alertMessage = "Failed to retrieve image URL: \(error.localizedDescription)"
                    self.showingAlert = true
                    return
                }

                guard let imageUrl = url else {
                    self.alertMessage = "Failed to retrieve image URL."
                    self.showingAlert = true
                    return
                }

                // Add the item to Firestore with the image URL
                self.firestoreManager.addItem(name: self.itemName, price: price, imageUrl: imageUrl.absoluteString) { error in
                    if let error = error {
                        self.alertMessage = "Failed to add item: \(error.localizedDescription)"
                    } else {
                        self.alertMessage = "Item added successfully!"
                        self.itemName = ""
                        self.itemPrice = ""
                        self.selectedImage = nil
                    }
                    self.showingAlert = true
                }
            }
        }
    }
}


// Corrected Preview Provider
struct AddItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        AddItemView()  // Corrected from 'ItemVeiw' to 'AddItemView'
    }
}
