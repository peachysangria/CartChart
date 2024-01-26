//
//  DropDownView.swift
//  CartChart
//
//  Created by Лилия Комиссарова on 16.01.2024.
//

import SwiftUI

struct DropDownCell {
    var title: String
    var chartProducts: [ChartProduct]
    var action: () -> ()
}

private struct DropDownButton: View {
    var actionModel: DropDownCell
    var select: (DropDownCell) -> ()
    
    var body: some View {
        Button {
            self.select(self.actionModel)
        } label: {
            DropDownCellView(chartTitle: actionModel.title, chartProducts: actionModel.chartProducts)
        }

    }
}

private struct DropDownMenu: View {
    var menuActions: [DropDownCell]
    var select: (DropDownCell) -> ()
    
    var body: some View {
        ScrollView (.horizontal) {
            HStack(spacing: 20) {
                ForEach(menuActions, id: \.title) { action in
                    DropDownButton(actionModel: action, select: self.select)
                }
            }
        }
    }
}

private struct DropDownHeader: View {
    var title: String
    var action: () -> ()
    var expand: Bool
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                Image(systemName: "chevron.\(expand ? "up" : "down")")
                    .fontWeight(.semibold)
                    .font(.system(size: 18))
            }
        }
        .foregroundColor(.black)
    }
}

struct DropDownView: View {
    var menuActions: [DropDownCell]
    var title: String
    @State var expand: Bool = false
     
    var body: some View {
        VStack(alignment: .leading) {
            DropDownHeader(title: title, action: { self.expand.toggle() }, expand: expand)
            if expand {
                DropDownMenu(menuActions: menuActions) { action in
                    action.action()
                    self.expand = false
                }
            }
        }
        .animation(.spring(), value: expand)
    }
}

let actions: [DropDownCell] = [DropDownCell(title: "One", chartProducts: [ChartProduct(product: Product(name: "пук", category: .cheese, image: Image(systemName: "leaf")))], action: {}),
                               DropDownCell(title: "Two", chartProducts: [ChartProduct(product: Product(name: "пук", category: .cheese, image: Image(systemName: "leaf")))], action: {}),
                               DropDownCell(title: "Three", chartProducts: [ChartProduct(product: Product(name: "пук", category: .cheese, image: Image(systemName: "leaf")))], action: {})]


struct DropDownView_Previews: PreviewProvider {
    static var previews: some View {
        DropDownView(menuActions: actions, title: "Мои списки")
    }
}
