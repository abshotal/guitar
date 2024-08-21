import SwiftUI

struct TabeehkView: View {
    let items: [ProductItem] = [
        // Define items for Moolah category
        ProductItem(name: "الغزالتين", price: 50.0, imageName: "TEA"),
        ProductItem(name: " جبنهّ", price: 50.0, imageName: "jabn"),
        ProductItem(name: "بسكويت رويال", price: 50.0, imageName: "r 1"),
        ProductItem(name: "زيت نصر", price: 50.0, imageName: "naa"),
        ProductItem(name: "حنآ", price: 50.0, imageName: "Henna"),
        ProductItem(name: "كابتن ماجد", price: 50.0, imageName: "mm")
    ]

    let gridItems = [GridItem(.adaptive(minimum: 150))]

    var body: some View {
        VStack {
            Text("Products")
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

struct TabeehkView_Previews: PreviewProvider {
    static var previews: some View {
        TabeehkView()
    }
}
