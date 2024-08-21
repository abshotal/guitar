import SwiftUI

struct MoolahView: View {
    
    let items: [ProductItem] = [
        // Define items for Moolah category
        ProductItem(name: "Guitar 1", price: 500.0, imageName: "jer"),
        ProductItem(name: "Guitar 2", price: 750.0, imageName: "jert"),
        ProductItem(name: "Guitar 3", price: 500.0, imageName: "jabn"),
        ProductItem(name: "Guitar 1", price: 500.0, imageName: "jer"),
        ProductItem(name: "Guitar 2", price: 750.0, imageName: "jert"),
        ProductItem(name: "Guitar 1", price: 500.0, imageName: "jer")
    
    ]

    let gridItems = [GridItem(.adaptive(minimum: 150))]

    var body: some View {
        VStack {
            Text("Neswan")
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
        .navigationTitle("")
    }
}
struct MoolahVeiw_Previews: PreviewProvider {
    static var previews: some View {
        MoolahView()
    }
}

