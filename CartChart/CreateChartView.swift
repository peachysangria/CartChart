
import SwiftUI

struct CreateChartView: View {
    var products: [Product] = [Product(name: "Молоко", category: .dairy, image: Image(systemName: "leaf")),
                               Product(name: "Молоко", category: .dairy, image: Image(systemName: "leaf")),
                               Product(name: "Молоко", category: .cheese, image: Image(systemName: "leaf")),
                               Product(name: "Молоко", category: .meat, image: Image(systemName: "leaf")),
                               Product(name: "Молоко", category: .fish, image: Image(systemName: "leaf")),
                               Product(name: "Хлеб сельский", category: .flour, image: Image(systemName: "leaf")),
                               Product(name: "Малина", category: .fruitsVegs, image: Image(systemName: "leaf")),             
                               Product(name: "Клубника", category: .fruitsVegs, image: Image(systemName: "leaf")),
                               Product(name: "Ежевика", category: .fruitsVegs, image: Image(systemName: "leaf")),
                               Product(name: "Сельдерей", category: .fruitsVegs, image: Image(systemName: "leaf")),
                               Product(name: "Груша", category: .fruitsVegs, image: Image(systemName: "leaf")),
                               Product(name: "Банан", category: .fruitsVegs, image: Image(systemName: "leaf")),
                               Product(name: "Вода 5л", category: .drinks, image: Image(systemName: "leaf")),
                               Product(name: "Red Bull 0.5", category: .drinks, image: Image(systemName: "leaf")),
                               Product(name: "Молоко", category: .houseChemicals, image: Image(systemName: "leaf")),
                               Product(name: "Молоко", category: .cosmetics, image: Image(systemName: "leaf"))]
    
    @State private var searchText = ""
    @State private var selectedCategory: Category = .dairy
    @State private var productsBasedOnCategory: [[Product]] = []
    @State private var animationProgress: CGFloat = 0
    let columns = [
        GridItem(.fixed(180)),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(pinnedViews: [.sectionHeaders]) {
                        Section {
                            ForEach(productsBasedOnCategory, id: \.self) { products in
                                ProductsSectionView(products)
                            }
                        } header: {
                            ScrollableTabs(proxy)
                                .background() {
                                    Rectangle()
                                        .fill(.white)
                                }
                        }
                    }
                    .padding(.horizontal, 10)
                    .searchable(text: $searchText, prompt: "Поиск")
                }
            }
            .coordinateSpace(name: "CONTENTVIEW")
            .onAppear {
                guard productsBasedOnCategory.isEmpty else { return }
                for category in Category.allCases {
                    let products = products.filter { $0.category == category }
                    productsBasedOnCategory.append(products)
                }
            }
        }
        .navigationTitle("Создать список")
    }
    
    @ViewBuilder
    func ProductsSectionView(_ products: [Product]) -> some View {
        VStack(alignment: .leading) {
            if let firstProduct = products.first {
                Text(firstProduct.category.rawValue)
                    .font(.title2)
                    .fontWeight(.medium)
            }
            
            LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
                ForEach(products) { product in
                    ProductRowView(product)
                }
            }
        }
        .padding(10)
        .id(products.category)
        .offset("CONTENTVIEW") { rect in
            let minY = rect.minY
            if (minY < 30 && -minY < (rect.midY / 2) && selectedCategory != products.category) && animationProgress == 0 {
                withAnimation(.easeInOut) {
                    selectedCategory = (minY < 30 && -minY < (rect.midY / 2) && selectedCategory != products.category) ? products.category : selectedCategory
                }
            }
        }
    }
    
    @ViewBuilder
    func ProductRowView(_ product: Product) -> some View {
        VStack {
            product.image
                .resizable()
                .frame(width: 160, height: 160)
                .cornerRadius(15)
                .foregroundColor(.orange)
            
            Text(product.name)
                .fontWeight(.medium)
                .font(.system(size: 18))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    func ScrollableTabs(_ proxy: ScrollViewProxy) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Category.allCases, id: \.rawValue) { category in
                    Text(category.rawValue)
                        .font(.title3)
                        .fontWeight(selectedCategory == category ? .bold : .medium)
                        .padding(.horizontal, 10)
                        .id(category.tabID)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                selectedCategory = category
                                animationProgress = 1.0
                                proxy.scrollTo(category, anchor: .topLeading)
                            }
                        }
                }
                .padding(.vertical, 15)
                .onChange(of: selectedCategory) { newValue in
                    withAnimation(.easeInOut) {
                        proxy.scrollTo(newValue.tabID, anchor: .center)
                    }
                }
                .checkAnimationEnd(for: animationProgress) {
                    animationProgress = 0.0
                }
            }
        }
    }
}

struct CreateChartView_Previews: PreviewProvider {
    static var previews: some View {
        CreateChartView()
    }
}
