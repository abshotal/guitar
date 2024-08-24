import SwiftUI
import Firebase

@main
struct ajApp: App {
    // Add an initializer to configure Firebase
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView() // Replace with your initial view
        }
    }
}
