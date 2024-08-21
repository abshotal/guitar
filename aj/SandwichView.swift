import SwiftUI

struct SandwichView: View {
    let items: [ProductItem] = [
        // Define items for Moolah category
        
        ProductItem(name: "علي الله", price: 50.0, imageName: "sj"),
        ProductItem(name: "علي الله", price: 50.0, imageName: "sj1"),
        ProductItem(name: "علي الله", price: 50.0, imageName: "sj2"),
        ProductItem(name: "جرتق", price: 50.0, imageName: "jal"),
        ProductItem(name: "علي الله", price: 50.0, imageName: "jal1"),
        ProductItem(name: "علي الله", price: 50.0, imageName: "jal2")
    ]

    let gridItems = [GridItem(.adaptive(minimum: 150))]

    var body: some View {
        VStack {
            
            Text("Jalabya")
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
