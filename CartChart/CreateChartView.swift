
import SwiftUI

struct CreateChartView: View {
    var products: [Product] = [Product(name: "Молоко", category: .dairy, image: Image(systemName: "leaf")),
                               Product(name: "Малина", category: .fruitsVegs, image: Image(systemName: "leaf")),
                               Product(name: "Клубника", category: .fruitsVegs, image: Image(systemName: "leaf")),
                               Product(name: "Ежевика", category: .fruitsVegs, image: Image(systemName: "leaf")),
                               Product(name: "Хлеб сельский", category: .flour, image: Image(systemName: "leaf")),
                               Product(name: "Груша", category: .fruitsVegs, image: Image(systemName: "leaf")),
                               Product(name: "Банан", category: .fruitsVegs, image: Image(systemName: "leaf")),
                               Product(name: "Вода 5л", category: .drinks, image: Image(systemName: "leaf")),
                               Product(name: "Red Bull 0.5", category: .drinks, image: Image(systemName: "leaf")),
                               Product(name: "Сельдерей", category: .fruitsVegs, image: Image(systemName: "leaf"))]
    
    @State private var searchText = ""
    @State private var selectedCategory: Category = .food
    @State private var productsBasedOnCategory: [[Product]] = []
    @State var gridLayout = Array(repeating: GridItem(.fixed(180)), count: 2)
    @State private var animationProgress: CGFloat = 0
    
    var body: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(pinnedViews: [.sectionHeaders]) {
                        Section {
                            ForEach(productsBasedOnCategory, id: \.self) { products in
                                ProductsSectiondView(products)
                            }
                        } header: {
                            ScrollableTabs(proxy)
                        }
                    }
                    .padding(.horizontal, 10)
                    .searchable(text: $searchText, prompt: "Поиск")
                }
            }
            .coordinateSpace(name: "CONTENTVIEW")
        }
        .navigationTitle("Создать список")
        .onAppear {
            guard productsBasedOnCategory.isEmpty else { return }
            for category in Category.allCases {
                let products = products.filter { $0.category == category }
                productsBasedOnCategory.append(products)
            }
        }
    }
    
    @ViewBuilder
    func ProductsSectiondView(_ products: [Product]) -> some View {
        VStack(alignment: .leading, spacing: 20) {
            if let firstProduct = products.first {
                Text(firstProduct.category.rawValue)
                    .font(.title2)
                    .fontWeight(.medium)
            }
            
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 15) {
                ForEach(products) { product in
                    ProductRowView(product)
                }
            }
        }
        .id(products.type)
        .offset("CONTENTVIEW") { rect in
            let minY = rect.minY
            if (minY < 30 && -minY < (rect.midY / 2) && selectedCategory != products.type) && animationProgress == 0 {
                withAnimation(.easeInOut) {
                    selectedCategory = (minY < 30 && -minY < (rect.midY / 2) && selectedCategory != products.type) ? products.type : selectedCategory
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
    }
    
    @ViewBuilder
    func ScrollableTabs(_ proxy: ScrollViewProxy) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Category.allCases, id: \.self) { category in
                    Text(category.rawValue)
                        .font(.system(size: 18))
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
            .background {
                Rectangle()
                    .fill(.white)
            }
        }
    }
}

struct CreateChartView_Previews: PreviewProvider {
    static var previews: some View {
        CreateChartView()
    }
}
