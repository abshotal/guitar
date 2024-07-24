import SwiftUI

struct MoolahView: View {
    
    let items: [ProductItem] = [
        // Define items for Moolah category
        ProductItem(name: "Guitar 1", price: 500.0, imageName: "guitar1"),
        ProductItem(name: "Guitar 2", price: 750.0, imageName: "guitar2"),
        ProductItem(name: "Guitar 1", price: 500.0, imageName: "guitar1")
    
    ]

    let gridItems = [GridItem(.adaptive(minimum: 150))]

    var body: some View {
        VStack {
            Text("Moolah")
                .font(.largeTitle)
                .padding()

            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 20) {
                    ForEach(items) { item in
                        ItemCells(item: item)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Moolah")
    }
}

