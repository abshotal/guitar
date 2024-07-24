import SwiftUI

struct ItemCells: View {
    let item: ProductItem
    
    var body: some View {
        VStack {
            Image(item.imageName) // Use imageName for dynamic images
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
                .clipped()
            
            Text(item.name)
                .font(.headline)
                .padding(.top, 5)
            
            Text("$\(item.price, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 2)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
    