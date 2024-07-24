import SwiftUI

struct DrawerView: View { 
    var body: some View { 
        List {
            NavigationLink(destination: HomeView()) {
                Label("Home", systemImage: "house")
            }
            NavigationLink(destination: SettingsView()) {
                Label("Settings", systemImage: "gear")
            }
            NavigationLink(destination: ProfileView()) {
                Label("Profile", systemImage: "person.crop.circle")
            }
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Menu")
        
    }
}

struct DrawerView_Previews: PreviewProvider {
    static var previews: some View {
        DrawerView()
    }
}
