import SwiftUI

struct ProductItem: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let imageName: String
}
