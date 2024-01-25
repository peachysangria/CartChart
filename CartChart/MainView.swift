
import SwiftUI

struct MainView: View {
//    @State var mainGridLayout = [ GridItem(.adaptive(minimum: 268)) ]
//    @State var savesGridLayout = Array(repeating: GridItem(.flexible()), count: 4)
    
    let chartLists: [ListCharts] = [ListCharts(name: "Еженедельные списки", charts: [Chart(name: "Корзина от 14 января", productsInChart: [ChartProduct(product: Product(name: "Миндально молоко", category: .food, image: Image(systemName: "leaf")), quanity: 1)])])]
    
    let actions: [DropDownCell] = [DropDownCell(title: "One", chartProducts: [ChartProduct(product: Product(name: "пук", category: .food, image: Image(systemName: "leaf")))], action: {}),
                                   DropDownCell(title: "Two", chartProducts: [ChartProduct(product: Product(name: "пук", category: .food, image: Image(systemName: "leaf")))], action: {}),
                                   DropDownCell(title: "Three", chartProducts: [ChartProduct(product: Product(name: "пук", category: .food, image: Image(systemName: "leaf")))], action: {})]
    
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
//            ScrollView {
//                VStack(alignment: .leading) {
//                    LazyHGrid(rows: mainGridLayout, alignment: .top, spacing: 13) {
//                        NavigationLink {
//                            CreateChartView()
//                        } label: {
//                            Image(systemName: "plus.circle")
//                                .font(.system(size: 50))
//                                .foregroundColor(.white)
//                                .frame(minWidth: 268, minHeight: 175)
//                                .background(Color.gray)
//                                .cornerRadius(15)
//                        }
//
//                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))], alignment: .trailing, spacing: 13) {
//                            Button(action: {
//                                print("id like to fuck him 70 times per day")
//                            }, label: {
//                                Image(systemName: "arrow.clockwise.heart")
//                                    .font(.system(size: 48))
//                                    .frame(width: 81, height: 81)
//                                    .foregroundColor(.white)
//                                    .background(Color.gray)
//                                    .cornerRadius(15)
//                                    .scaleEffect(CGSize(width: -1.0, height: 1.0))
//                            })
//
//                            Button(action: {
//                                print("joking, 1 thousand")
//                            }, label: {
//                                Image(systemName: "gearshape")
//                                    .font(.system(size: 45))
//                                    .foregroundColor(.white)
//                                    .frame(minWidth: 81, minHeight: 81)
//                                    .background(Color.gray)
//                                    .cornerRadius(15)
//                            })
//                        }
//                    }
//                    .padding()
//
//                    Text("Сохраненные списки")
//                        .fontWeight(.bold)
//                        .font(.system(size: 25))
//                        .padding()
//
//                    LazyVGrid(columns: savesGridLayout) {
//                        //сохраняет пользователь, думай как сделать красиво и логично
//                    }
//                }
//            }
//            .navigationTitle("Главная")
//            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
