//
//  Chart.swift
//  CartChart
//
//  Created by Лилия Комиссарова on 25.01.2024.
//

import Foundation

struct Chart: Identifiable {
    var id = UUID()
    var name: String //автозаполнение по дате
    var productsInChart: [ChartProduct]
}
