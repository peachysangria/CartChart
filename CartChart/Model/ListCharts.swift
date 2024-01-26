//
//  ListCharts.swift
//  CartChart
//
//  Created by Лилия Комиссарова on 25.01.2024.
//

import Foundation

//в будущем можно будет добавлять свои
struct ListCharts: Identifiable {
    var id = UUID()
    var name: String
    var charts: [Chart]
}
