//
//  restaurantApp.swift
//  restaurant
//
//  Created by Mr Ravi on 29/11/23.
//

import SwiftUI

@main
struct restaurantApp: App {
    @StateObject var orders = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(orders)
        }
    }
}
