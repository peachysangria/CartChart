
import SwiftUI

struct MainView: View {    
    let chartLists: [ListCharts] = [ListCharts(name: "Еженедельные списки", charts: [Chart(name: "Корзина от 14 января", productsInChart: [ChartProduct(product: Product(name: "Миндально молоко", category: .cheese, image: Image(systemName: "leaf")), quanity: 1)])])]
    
    let actions: [DropDownCell] = [DropDownCell(title: "One", chartProducts: [ChartProduct(product: Product(name: "пук", category: .cheese, image: Image(systemName: "leaf")))], action: {}),
                                   DropDownCell(title: "Two", chartProducts: [ChartProduct(product: Product(name: "пук", category: .cheese, image: Image(systemName: "leaf")))], action: {}),
                                   DropDownCell(title: "Three", chartProducts: [ChartProduct(product: Product(name: "пук", category: .cheese, image: Image(systemName: "leaf")))], action: {})]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 30) {
                NavigationLink {
                    CreateChartView()
                } label: {
                    Text("Новый список")
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                }
                
                DropDownView(menuActions: actions, title: "Мои списки")
                
                //DropDownView(menuActions: actions, title: "Список на неделю")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(25)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
