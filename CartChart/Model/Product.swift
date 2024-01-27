//
//  Product.swift
//  CartChart
//
//  Created by Лилия Комиссарова on 25.01.2024.
//

import Foundation
import SwiftUI

struct Product: Hashable, Identifiable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id = UUID()
    var name: String
    var category: Category
    var image: Image
    var unit: Unit
}
