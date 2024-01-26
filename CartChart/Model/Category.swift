
import Foundation

enum Category: String, CaseIterable {
    //case food = "Все"
    case dairy = "Молочные продукты и яйца"
    case cheese = "Сыр"
    case meat = "Мясо"
    case fish = "Рыба"
    case flour = "Хлеб и выпечка"
    case fruitsVegs = "Фрукты и овощи"
    case drinks = "Напитки"
    case houseChemicals = "Для дома"
    case cosmetics = "Косметика"
    
    var tabID: String {
        return self.rawValue + self.rawValue.prefix(4)
    }
}
