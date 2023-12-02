//
//  MainView.swift
//  restaurant
//
//  Created by Mr Ravi on 01/12/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var order:Order
    var body: some View {
        TabView(selection: .constant("menu"))  {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }.tag("menu")
            CartView()
                .badge(order.items.count)
                .tabItem {
                    Label("Cart", systemImage: "square.and.pencil")
                }.tag("cart")
        }
    }
}

#Preview {
    MainView()
        .environmentObject(Order())
}
