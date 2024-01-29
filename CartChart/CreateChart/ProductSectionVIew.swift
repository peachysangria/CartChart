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
    @State private var quanity: Int = 0
    @State private var unitNumber: Double?

    var body: some View {
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
                            chartProductManager(product: product, quanity: quanity, unitNumber: unitNumber)
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
                                .foregroundStyle(quanity > 0 ? Color.white : Color.clear)
                                .fontWeight(.bold)
                                .font(.title)
                                .offset(CGSize(width: 0, height: -15))
                            
                            TextField("UnitNumber", value: $unitNumber, format: .number, prompt:
                                        Text("ввод \(product.unit.rawValue)").foregroundStyle(quanity > 0 ? Color.white : Color.clear))
                                .keyboardType(.decimalPad)
                                .frame(width: 65, height: 20, alignment: .center)
                                .offset(CGSize(width: 4, height: -10))
                                .onChange(of: unitNumber) { oldValue, newValue in
                                    chartProductManager(product: product, quanity: quanity, unitNumber: newValue)
                                }
                        }
                    }
                    
                    Button {
                        quanity += 1
                        chartProductManager(product: product, quanity: quanity, unitNumber: unitNumber)
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
    
    func chartProductManager(product: Product, quanity: Int, unitNumber: Double?) {
        chartProducts.removeAll(where:{ $0.product == self.product })
        print("минусанула")
        if quanity != 0 {
            guard unitNumber != nil else {
                chartProducts.append(ChartProduct(product: product, quanity: quanity))
                print("плюсанула без веса")
                return
            }
            
            chartProducts.append(ChartProduct(product: product, quanity: quanity, units: unitNumber))
            print("плюсанула с весом")
        }
    }
}

#Preview {
    ProductSectionVIew(product: Product(name: "Молочко", category: .cosmetics, image: Image(systemName: "leaf"), unit: .grams), chartProducts: .constant([ChartProduct(product: Product(name: "Молочко", category: .cosmetics, image: Image(systemName: "leaf"), unit: .grams), quanity: 0)]))
}
