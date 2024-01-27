//
//  ProductSectionVIew.swift
//  CartChart
//
//  Created by Лилия Комиссарова on 27.01.2024.
//

import SwiftUI

struct ProductSectionVIew: View {
    var product: Product
    @Binding var chartProducts: [ChartProduct]
    @State var quanity: Int = 0
    
    var body: some View {
        //var chartProduct = ChartProduct(product: product, quanity: quanity)
        
        VStack {
            ZStack {
                product.image
                    .resizable()
                    .frame(width: 160, height: 160)
                    .cornerRadius(15)
                    .foregroundColor(.orange)
                HStack {
                    Button {
    //                    switch Unit {
    //                    case .grams: Text("гр")
    //                    case .litres: Text("л")
    //                    }
                        if quanity > 0 {
                            quanity -= 1
                        }
                        //chartProducts.append(ChartProduct(product: product))
                    } label: {
                        UnevenRoundedRectangle()
                            .foregroundColor(Color.gray.opacity(0.6))
                            .clipShape(
                                .rect(
                                    topLeadingRadius: 20,
                                    bottomLeadingRadius: 20,
                                    bottomTrailingRadius: 0,
                                    topTrailingRadius: 0
                                )
                            )
                            .frame(width: 50, height: 160, alignment: .trailing)
                            .padding(.horizontal, -5)
                    }
                    
                    Rectangle()
                        .foregroundColor(Color.gray.opacity(0.6))
                        .frame(width: 60, height: 160, alignment: .center)
                        .padding(.horizontal, -3)
                    
                    Button {
                        quanity += 1
                        print("кнопка кликнута")
                    } label: {
                        UnevenRoundedRectangle()
                            .foregroundColor(quanity > 0 ? Color.gray.opacity(0.6) : Color.clear)
                            .clipShape(
                                .rect(
                                    topLeadingRadius: 0,
                                    bottomLeadingRadius: 0,
                                    bottomTrailingRadius: 20,
                                    topTrailingRadius: 20
                                )
                            )
                            .frame(width: 50, height: 160, alignment: .trailing)
                            .padding(.horizontal, -5)
                    }
                }
            }
            
            Text(product.name)
                .fontWeight(.medium)
                .font(.system(size: 18))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

//#Preview {
//    ProductSectionVIew(product: Product(name: "Vagina", category: .cosmetics, image: Image(systemName: "leaf"), unit: .litres), chartProducts: [ChartProduct(product: Product(name: "Vagina", category: .cosmetics, image: Image(systemName: "leaf"), unit: .litres), quanity: 0)])
//}
