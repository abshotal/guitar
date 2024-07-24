import SwiftUI

struct SandwichView: View {
    let items: [ProductItem] = [
        // Define items for Sandwich category
    ]

    let gridItems = [GridItem(.adaptive(minimum: 150))]

    var body: some View {
        VStack {
            Text("Sandwich Category")
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
        .navigationTitle("Sandwich")
    }
}

struct SandwichView_Previews: PreviewProvider {
    static var previews: some View {
        SandwichView()
    }
}
