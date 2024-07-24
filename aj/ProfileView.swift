import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profile")
                .font(.largeTitle)
                .padding()
            // Add profile-related content here
        }
        .navigationTitle("Profile")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
