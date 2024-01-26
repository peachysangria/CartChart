//
//  DropDownCellView.swift
//  CartChart
//
//  Created by Лилия Комиссарова on 16.01.2024.
//

import SwiftUI

struct DropDownCellView: View {
    
    var chartTitle: String
    var chartProducts: [ChartProduct]
    
    var gridLayout = Array(repeating: GridItem(.fixed(70)), count: 2)
    
    var body: some View {
        VStack(alignment: .center) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 7) {
                ForEach(chartProducts.shuffled().prefix(4)) { product in
                    product.product.image
                        .frame(width: 70, height: 70)
                        .cornerRadius(10)
                        .foregroundColor(.mint)
                }
            }
            .padding(.top, 15)
            
            Text(chartTitle)
                .fontWeight(.medium)
                .font(.system(size: 20))
        }
    }
}

struct DropDownCellView_Previews: PreviewProvider {
    static var previews: some View {
        DropDownCellView(chartTitle: "Список N", chartProducts: [ChartProduct(product: Product(name: "пук", category: .cheese, image: Image(systemName: "leaf")))])
    }
}
