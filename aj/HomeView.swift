import SwiftUI

struct HomeView: View {
    let items: [ProductItem] = [
        ProductItem(name: "Guitar 1", price: 500.0, imageName: "n"),
        ProductItem(name: "Guitar 2", price: 750.0, imageName: "r"),
        ProductItem(name: "Guitar 1", price: 500.0, imageName: "r"),
        ProductItem(name: "Guitar 2", price: 750.0, imageName: "n"),
        ProductItem(name: "Guitar 1", price: 500.0, imageName: "n"),
        ProductItem(name: "Guitar 2", price: 750.0, imageName: "r"),
        ProductItem(name: "Guitar 1", price: 500.0, imageName: "r"),
        ProductItem(name: "Guitar 2", price: 750.0, imageName: "n")
        // Add more items if needed
    ]
    
    let gridItems = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("AJ SHOP")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    Spacer()
                    Menu {
                        NavigationLink(destination: HomeView()) {
                            Label("Home", systemImage: "house")
                        }
                        NavigationLink(destination: MoolahView()) {
                            Label("Moolah 🍲", systemImage: "")
                                .onTapGesture {
                                    print("taped")
                                }
                        }
                        NavigationLink(destination: TabeehkView()) {
                            Label("Tabeehk 🍲", systemImage: "")
                        }
                        NavigationLink(destination: SandwichView()) {
                            Label("Sandwich 🥪", systemImage: "")
                        }
                        NavigationLink(destination: ProfileView()) {
                            Label("Profile", systemImage: "person.crop.circle")
                        }
                        NavigationLink(destination: SettingsView()) {
                            Label("Settings", systemImage: "gear")
                        }
                    } label: {
                        Label("Menu", systemImage: "line.horizontal.3")
                            .imageScale(.large)
                            .padding()
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                .background(Color.white)
                
                SearchView()
                    .background(Color.white)// Integrate search functionality here
                
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 20) {
                        ForEach(items) { item in
                            ItemCells(item: item)
                        }
                    }
                    .padding()
                }
            }
            .background(Color.white.ignoresSafeArea()) // Background color for the entire view
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

