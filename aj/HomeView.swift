import SwiftUI

struct HomeView: View {
    let items: [ProductItem] = [
        ProductItem(name: " ", price: 500.0, imageName: "r 1"),
        ProductItem(name: " ", price: 750.0, imageName: "naa"),
        ProductItem(name: " ", price: 500.0, imageName: "jer"),
        ProductItem(name: " ", price: 750.0, imageName: "mm"),
        ProductItem(name: " ", price: 500.0, imageName: "TEA"),
        ProductItem(name: " ", price: 750.0, imageName: "sj"),
        ProductItem(name: " ", price: 500.0, imageName: "sj2"),
        ProductItem(name: " ", price: 750.0, imageName: "jabn")
        // Add more items if needed
    ]
    
    let gridItems = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationStack {
                    VStack {
                        HStack {
                            // Container for "AJ SHOP" text
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.blue.opacity(0.5)) // Adjust color and opacity as needed
                                    .frame(height: 50) // Adjust the height as needed
                                
                                Text("AJ SHOP")
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                                    .padding(.horizontal) // Adjust padding as needed
                            }
                    Spacer()
                    Menu {
                        NavigationLink(destination: HomeView()) {
                            Label("Home", systemImage: "house")
                        }
                        NavigationLink(destination: MoolahView()) {
                            Label("Neswan                              👩🏾‍🦱", systemImage: "")
                                .onTapGesture { 
                                    print("taped")
                                }
                        }
                        NavigationLink(destination: TabeehkView()) {
                            Label("Products                             🍲", systemImage: "")
                        }
                        NavigationLink(destination: SandwichView()) {
                            Label("Jalabya                               👳🏿‍♂️", systemImage: "")
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

