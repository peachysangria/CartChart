//
//  ChartProduct.swift
//  CartChart
//
//  Created by Лилия Комиссарова on 25.01.2024.
//

import Foundation

struct ChartProduct: Identifiable {
    var id = UUID()
    
    var product: Product
    var quanity: Int
    var units: Double?
}
