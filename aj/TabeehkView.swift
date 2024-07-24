import SwiftUI

struct TabeehkView: View {
    let items: [ProductItem] = [
        // Define items for Tabeehk category
    ]

    let gridItems = [GridItem(.adaptive(minimum: 150))]

    var body: some View {
        VStack {
            Text("Tabeehk Category")
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
        .navigationTitle("Tabeehk")
    }
}

struct TabeehkView_Previews: PreviewProvider {
    static var previews: some View {
        TabeehkView()
    }
}
