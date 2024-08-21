import SwiftUI
import PhotosUI

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

        firestoreManager.addItem(name: itemName, price: price, photo: image) { error in
            if let error = error {
                alertMessage = "Failed to add item: \(error.localizedDescription)"
            } else {
                alertMessage = "Item added successfully!"
                itemName = ""
                itemPrice = ""
                selectedImage = nil
            }
            showingAlert = true
        }
    }
}
