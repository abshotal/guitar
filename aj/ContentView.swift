import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var errorMessage: String? // State to track error message

    fileprivate func extractedFunc() -> ZStack<TupleView<(some View, some View)>> {
        return ZStack {
            Color(.black).ignoresSafeArea() // Black background for login
            
            VStack {
                // Store logo
                Image("n") // Ensure the image is in your assets
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(34)
                    .padding()
                
                // Store title
                Text("AJ SHOP")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                // Store description
                Text("All What U Want is here")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                // Username field
                TextField("Enter user name", text: $username)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                
                // Password field
                SecureField("Enter Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                    .foregroundColor(.black)
                // Error message
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.bottom, 10)
                }
                
                // Login button
                Button("Login") {
                    // Validate login credentials
                    if username == "T" && password == "1" {
                        isLoggedIn = true // Successful login
                        errorMessage = nil // Clear error message if login is successful
                    } else {
                        // Set error message
                        errorMessage = "Invalid username or password"
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
        }
    }
    
    var body: some View {
        VStack {
            if isLoggedIn {
                HomeView() // Show HomeView on successful login
            } else {
                extractedFunc()
            }
        }
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
