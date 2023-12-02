//
//  ContentView.swift
//  restaurant
//
//  Created by Mr Ravi on 29/11/23.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")

    var body: some View {
        NavigationStack{
            List {
                ForEach(menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            NavigationLink(value: item) {
                                ListItem(item: item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .navigationDestination(for: MenuItem.self, destination: { item in
                DetailView(item: item)
            })
            .listStyle(.grouped)
        }
    }
}

#Preview {
    //NavigationStack {
        ContentView()
    //}
    
}
