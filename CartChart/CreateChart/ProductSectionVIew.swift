//
//  ProductSectionVIew.swift
//  CartChart
//
//  Created by Лилия Комиссарова on 27.01.2024.
//

import SwiftUI

struct ProductSectionVIew: View {
    var product: Product
    //@Binding var chartProducts: [ChartProduct]
    @State private var quanity: Int = 0
    @State private var unitNumber: Double?
    @FocusState private var fieldIsFocused: Bool

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
                        if quanity > 0 {
                            quanity -= 1
                        }
                    } label: {
                        UnevenRoundedRectangle()
                            .foregroundColor(quanity > 0 ? Color.gray.opacity(0.6) : Color.clear)
                            .clipShape(
                                .rect(
                                    topLeadingRadius: 20,
                                    bottomLeadingRadius: 20,
                                    bottomTrailingRadius: 0,
                                    topTrailingRadius: 0
                                )
                            )
                            .frame(width: 50, height: 160, alignment: .trailing)
                            .padding(.horizontal, -10.5)
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(quanity > 0 ? Color.gray.opacity(0.6) : Color.clear)
                            .frame(width: 60, height: 160, alignment: .center)
                            .padding(.horizontal, -3)
                        VStack {
                            Text("\(quanity)")
                                .foregroundStyle(quanity > 0 ? Color.white : Color.black)
                                .fontWeight(.bold)
                                .font(.title)
                                .offset(CGSize(width: 0, height: -20))                            
                            
                            TextField("UnitNumber", value: $unitNumber, format: .number, prompt: Text("ввод \(product.unit.rawValue)"))
                                .keyboardType(.decimalPad)
                                .focused($fieldIsFocused)
                                .frame(width: 65, height: 20, alignment: .center)
                                .offset(CGSize(width: 4, height: -15))
                                //.submitLabel(.done)
                        }
                    }
                    
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
                            .padding(.horizontal, -10.5)
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

#Preview {
    ProductSectionVIew(product: Product(name: "Молочко", category: .cosmetics, image: Image(systemName: "leaf"), unit: .litres))
}
